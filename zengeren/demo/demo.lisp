(asdf:operate 'asdf:load-op :lispbuilder-sdl)
(asdf:operate 'asdf:load-op :lispbuilder-sdl-image)
(asdf:operate 'asdf:load-op :lispbuilder-sdl-mixer)
(asdf:operate 'asdf:load-op :lispbuilder-sdl-ttf)
(asdf:operate 'asdf:load-op :lispbuilder-sdl-gfx)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (when (find-package :swank)
    (pushnew :my-game-debug *features*)))

(defun every-n-frames (max)
  (let ((count 0))
    #'(lambda ()
	(if (eql 0 (mod (incf count 1) max))
	    (setf count 0)
	    nil))))

(defun draw-fps (string x y font surface render-p)
  ;; Create a new FPS string when render-p is T
  (when render-p
    (sdl:render-string-shaded string sdl:*white* sdl:*black* :font font :cache t :free t))
  ;; Draw the string each frame
  (sdl:draw-font-at-* x y :font font :surface surface))

(defun draw ()
  (let ((100-frames-p (every-n-frames 100)))
    (sdl:clear-display (sdl:color :r 0 :g 0 :b 0))
    (sdl:draw-rectangle-* 150 
			  150
			  100
			  100
			  :color (sdl:color :r (random 255)
					    :g (random 255)
					    :b (random 255)))

    (draw-fps (format nil "FPS : ~2$" (sdl:average-fps))
	      0 0 sdl:*default-font* sdl:*default-surface*
	      t)
    (sdl:update-display)))

(defun game-main ()

    (sdl:with-init ()
      (sdl:window 640 480
		  :title-caption "全ゲ連でゲームのデモするよー。")
      (setf (sdl:frame-rate) 30)
      (sdl:initialise-default-font sdl:*font-9x18*)
      
      (sdl:with-events ()
	(:quit-event () t)
	(:video-expose-event () (sdl:update-display))
	(:idle ()
	       #+my-game-debug
	       (let ((connection
		      (or swank::*emacs-connection* (swank::default-connection))))
		 (when (and connection (not (eql swank:*communication-style* :spawn)))
		   (swank::handle-requests connection t)))
	       (draw)))))