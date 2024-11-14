;;; xcb-dbe.el --- X11 Dbe extension  -*- lexical-binding: t -*-

;; Copyright (C) 2015-2024 Free Software Foundation, Inc.

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This file was generated by 'xelb-gen' from 'dbe.xml',
;; which you can retrieve from <git://anongit.freedesktop.org/xcb/proto>.

;;; Code:

(require 'xcb-types)

(defconst xcb:dbe:-extension-xname "DOUBLE-BUFFER")
(defconst xcb:dbe:-extension-name "Dbe")
(defconst xcb:dbe:-major-version 1)
(defconst xcb:dbe:-minor-version 0)

(require 'xcb-xproto)

(xcb:deftypealias 'xcb:dbe:BackBuffer 'xcb:DRAWABLE)

(defconst xcb:dbe:SwapAction:Undefined 0)
(defconst xcb:dbe:SwapAction:Background 1)
(defconst xcb:dbe:SwapAction:Untouched 2)
(defconst xcb:dbe:SwapAction:Copied 3)

(defclass xcb:dbe:SwapInfo
  (xcb:-struct)
  ((window :initarg :window :type xcb:WINDOW)
   (swap-action :initarg :swap-action :type xcb:CARD8)
   (pad~0 :initform 3 :type xcb:-pad)))

(defclass xcb:dbe:BufferAttributes
  (xcb:-struct)
  ((window :initarg :window :type xcb:WINDOW)))

(defclass xcb:dbe:VisualInfo
  (xcb:-struct)
  ((visual-id :initarg :visual-id :type xcb:VISUALID)
   (depth :initarg :depth :type xcb:CARD8)
   (perf-level :initarg :perf-level :type xcb:CARD8)
   (pad~0 :initform 2 :type xcb:-pad)))

(defclass xcb:dbe:VisualInfos
  (xcb:-struct)
  ((n-infos :initarg :n-infos :type xcb:CARD32)
   (infos~ :initform
	   '(name infos type xcb:dbe:VisualInfo size
		  (xcb:-fieldref 'n-infos))
	   :type xcb:-list)
   (infos :initarg :infos :type xcb:-ignore)))

(defclass xcb:dbe:BadBuffer
  (xcb:-error)
  ((~code :initform 0)
   (bad-buffer :initarg :bad-buffer :type xcb:dbe:BackBuffer)))

(defclass xcb:dbe:QueryVersion
  (xcb:-request)
  ((~opcode :initform 0 :type xcb:-u1)
   (major-version :initarg :major-version :type xcb:CARD8)
   (minor-version :initarg :minor-version :type xcb:CARD8)
   (pad~0 :initform 2 :type xcb:-pad)))
(defclass xcb:dbe:QueryVersion~reply
  (xcb:-reply)
  ((pad~0 :initform 1 :type xcb:-pad)
   (~sequence :type xcb:CARD16)
   (length :type xcb:CARD32)
   (major-version :initarg :major-version :type xcb:CARD8)
   (minor-version :initarg :minor-version :type xcb:CARD8)
   (pad~1 :initform 22 :type xcb:-pad)))

(defclass xcb:dbe:AllocateBackBuffer
  (xcb:-request)
  ((~opcode :initform 1 :type xcb:-u1)
   (window :initarg :window :type xcb:WINDOW)
   (buffer :initarg :buffer :type xcb:dbe:BackBuffer)
   (swap-action :initarg :swap-action :type xcb:CARD8)
   (pad~0 :initform 3 :type xcb:-pad)))

(defclass xcb:dbe:DeallocateBackBuffer
  (xcb:-request)
  ((~opcode :initform 2 :type xcb:-u1)
   (buffer :initarg :buffer :type xcb:dbe:BackBuffer)))

(defclass xcb:dbe:SwapBuffers
  (xcb:-request)
  ((~opcode :initform 3 :type xcb:-u1)
   (n-actions :initarg :n-actions :type xcb:CARD32)
   (actions~ :initform
	     '(name actions type xcb:dbe:SwapInfo size
		    (xcb:-fieldref 'n-actions))
	     :type xcb:-list)
   (actions :initarg :actions :type xcb:-ignore)))

(defclass xcb:dbe:BeginIdiom
  (xcb:-request)
  ((~opcode :initform 4 :type xcb:-u1)))

(defclass xcb:dbe:EndIdiom
  (xcb:-request)
  ((~opcode :initform 5 :type xcb:-u1)))

(defclass xcb:dbe:GetVisualInfo
  (xcb:-request)
  ((~opcode :initform 6 :type xcb:-u1)
   (n-drawables :initarg :n-drawables :type xcb:CARD32)
   (drawables~ :initform
	       '(name drawables type xcb:DRAWABLE size
		      (xcb:-fieldref 'n-drawables))
	       :type xcb:-list)
   (drawables :initarg :drawables :type xcb:-ignore)))
(defclass xcb:dbe:GetVisualInfo~reply
  (xcb:-reply)
  ((pad~0 :initform 1 :type xcb:-pad)
   (~sequence :type xcb:CARD16)
   (length :type xcb:CARD32)
   (n-supported-visuals :initarg :n-supported-visuals :type xcb:CARD32)
   (pad~1 :initform 20 :type xcb:-pad)
   (supported-visuals~ :initform
		       '(name supported-visuals type xcb:dbe:VisualInfos size
			      (xcb:-fieldref 'n-supported-visuals))
		       :type xcb:-list)
   (supported-visuals :initarg :supported-visuals :type xcb:-ignore)))

(defclass xcb:dbe:GetBackBufferAttributes
  (xcb:-request)
  ((~opcode :initform 7 :type xcb:-u1)
   (buffer :initarg :buffer :type xcb:dbe:BackBuffer)))
(defclass xcb:dbe:GetBackBufferAttributes~reply
  (xcb:-reply)
  ((pad~0 :initform 1 :type xcb:-pad)
   (~sequence :type xcb:CARD16)
   (length :type xcb:CARD32)
   (attributes :initarg :attributes :type xcb:dbe:BufferAttributes)
   (pad~1 :initform 20 :type xcb:-pad)))

(defconst xcb:dbe:error-number-class-alist
  '((0 . xcb:dbe:BadBuffer))
  "(error-number . error-class) alist.")



(provide 'xcb-dbe)

;;; xcb-dbe.el ends here