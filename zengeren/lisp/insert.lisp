(declaim (optimize (debug 0) (safety 0)
                   (speed 3) (space 3) (compilation-speed 3)))
(defclass charactor ()
  ((x :initarg :x)
   (y :initarg :y)))
(setq stack (make-array 3 :element-type 'integer :fill-pointer t :adjustable t))
(time (loop repeat 10000000
	      do
	      (vector-push (random 100) stack)))

(time (loop repeat 10000000
	 do
	   (make-instance 'charactor 
;;			  :x  (random 640)
;;			  :y (random 480)
			  )))