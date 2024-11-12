;;; xcb-shm.el --- X11 Shm extension  -*- lexical-binding: t -*-

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

;; This file was generated by 'xelb-gen' from 'shm.xml',
;; which you can retrieve from <git://anongit.freedesktop.org/xcb/proto>.

;;; Code:

(require 'xcb-types)

(defconst xcb:shm:-extension-xname "MIT-SHM")
(defconst xcb:shm:-extension-name "Shm")
(defconst xcb:shm:-major-version 1)
(defconst xcb:shm:-minor-version 2)

(require 'xcb-xproto)

(xcb:deftypealias 'xcb:shm:SEG 'xcb:-u4)

(defclass xcb:shm:Completion
  (xcb:-event)
  ((~code :initform 0)
   (pad~0 :initform 1 :type xcb:-pad)
   (~sequence :type xcb:CARD16)
   (drawable :initarg :drawable :type xcb:DRAWABLE)
   (minor-event :initarg :minor-event :type xcb:CARD16)
   (major-event :initarg :major-event :type xcb:BYTE)
   (pad~1 :initform 1 :type xcb:-pad)
   (shmseg :initarg :shmseg :type xcb:shm:SEG)
   (offset :initarg :offset :type xcb:CARD32)))

(defclass xcb:shm:BadSeg
  (xcb:-error xcb:Value)
  ((~code :initform 0)))

(defclass xcb:shm:QueryVersion
  (xcb:-request)
  ((~opcode :initform 0 :type xcb:-u1)))
(defclass xcb:shm:QueryVersion~reply
  (xcb:-reply)
  ((shared-pixmaps :initarg :shared-pixmaps :type xcb:BOOL)
   (~sequence :type xcb:CARD16)
   (length :type xcb:CARD32)
   (major-version :initarg :major-version :type xcb:CARD16)
   (minor-version :initarg :minor-version :type xcb:CARD16)
   (uid :initarg :uid :type xcb:CARD16)
   (gid :initarg :gid :type xcb:CARD16)
   (pixmap-format :initarg :pixmap-format :type xcb:CARD8)
   (pad~0 :initform 15 :type xcb:-pad)))

(defclass xcb:shm:Attach
  (xcb:-request)
  ((~opcode :initform 1 :type xcb:-u1)
   (shmseg :initarg :shmseg :type xcb:shm:SEG)
   (shmid :initarg :shmid :type xcb:CARD32)
   (read-only :initarg :read-only :type xcb:BOOL)
   (pad~0 :initform 3 :type xcb:-pad)))

(defclass xcb:shm:Detach
  (xcb:-request)
  ((~opcode :initform 2 :type xcb:-u1)
   (shmseg :initarg :shmseg :type xcb:shm:SEG)))

(defclass xcb:shm:PutImage
  (xcb:-request)
  ((~opcode :initform 3 :type xcb:-u1)
   (drawable :initarg :drawable :type xcb:DRAWABLE)
   (gc :initarg :gc :type xcb:GCONTEXT)
   (total-width :initarg :total-width :type xcb:CARD16)
   (total-height :initarg :total-height :type xcb:CARD16)
   (src-x :initarg :src-x :type xcb:CARD16)
   (src-y :initarg :src-y :type xcb:CARD16)
   (src-width :initarg :src-width :type xcb:CARD16)
   (src-height :initarg :src-height :type xcb:CARD16)
   (dst-x :initarg :dst-x :type xcb:INT16)
   (dst-y :initarg :dst-y :type xcb:INT16)
   (depth :initarg :depth :type xcb:CARD8)
   (format :initarg :format :type xcb:CARD8)
   (send-event :initarg :send-event :type xcb:BOOL)
   (pad~0 :initform 1 :type xcb:-pad)
   (shmseg :initarg :shmseg :type xcb:shm:SEG)
   (offset :initarg :offset :type xcb:CARD32)))

(defclass xcb:shm:GetImage
  (xcb:-request)
  ((~opcode :initform 4 :type xcb:-u1)
   (drawable :initarg :drawable :type xcb:DRAWABLE)
   (x :initarg :x :type xcb:INT16)
   (y :initarg :y :type xcb:INT16)
   (width :initarg :width :type xcb:CARD16)
   (height :initarg :height :type xcb:CARD16)
   (plane-mask :initarg :plane-mask :type xcb:CARD32)
   (format :initarg :format :type xcb:CARD8)
   (pad~0 :initform 3 :type xcb:-pad)
   (shmseg :initarg :shmseg :type xcb:shm:SEG)
   (offset :initarg :offset :type xcb:CARD32)))
(defclass xcb:shm:GetImage~reply
  (xcb:-reply)
  ((depth :initarg :depth :type xcb:CARD8)
   (~sequence :type xcb:CARD16)
   (length :type xcb:CARD32)
   (visual :initarg :visual :type xcb:VISUALID)
   (size :initarg :size :type xcb:CARD32)))

(defclass xcb:shm:CreatePixmap
  (xcb:-request)
  ((~opcode :initform 5 :type xcb:-u1)
   (pid :initarg :pid :type xcb:PIXMAP)
   (drawable :initarg :drawable :type xcb:DRAWABLE)
   (width :initarg :width :type xcb:CARD16)
   (height :initarg :height :type xcb:CARD16)
   (depth :initarg :depth :type xcb:CARD8)
   (pad~0 :initform 3 :type xcb:-pad)
   (shmseg :initarg :shmseg :type xcb:shm:SEG)
   (offset :initarg :offset :type xcb:CARD32)))

(defclass xcb:shm:AttachFd
  (xcb:-request)
  ((~opcode :initform 6 :type xcb:-u1)
   (shmseg :initarg :shmseg :type xcb:shm:SEG)
   (shm-fd :type xcb:fd)
   (read-only :initarg :read-only :type xcb:BOOL)
   (pad~0 :initform 3 :type xcb:-pad)))

(defclass xcb:shm:CreateSegment
  (xcb:-request)
  ((~opcode :initform 7 :type xcb:-u1)
   (shmseg :initarg :shmseg :type xcb:shm:SEG)
   (size :initarg :size :type xcb:CARD32)
   (read-only :initarg :read-only :type xcb:BOOL)
   (pad~0 :initform 3 :type xcb:-pad)))
(defclass xcb:shm:CreateSegment~reply
  (xcb:-reply)
  ((nfd :initarg :nfd :type xcb:CARD8)
   (~sequence :type xcb:CARD16)
   (length :type xcb:CARD32)
   (shm-fd :type xcb:fd)
   (pad~0 :initform 24 :type xcb:-pad)))

(defconst xcb:shm:error-number-class-alist
  '((0 . xcb:shm:BadSeg))
  "(error-number . error-class) alist.")

(defconst xcb:shm:event-number-class-alist
  '((0 . xcb:shm:Completion))
  "(event-number . event-class) alist.")



(provide 'xcb-shm)

;;; xcb-shm.el ends here
