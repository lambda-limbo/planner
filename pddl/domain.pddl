(define (domain gratek-robots)

	(:requirements 
	    :adl 
	    :typing 
	    :equality 
	    :negative-preconditions)
	
	(:types location 
	        robot 
	        package 
	        shelf
	        category	;; category of the packages and the shelf
			size		;; size of the packages
	)

	(:predicates 
		(at ?o ?l)                          ;; Is the object ?o at location ?l
		(holding ?r - robot ?p - package)   ;; Is the robot ?r holding any package?
		(available ?o) 	                    ;; Is the object ?o available to be picked up?

		(is-placeable ?p - package ?s - shelf) ;; is the package ?p placable in the shelf ?s

		(is-size ?o - object ?s - size) ;; is the object ?o of size ?s
		(is-category ?o - object ?c - category) ;; is the object ?o of the category ?c

		(in-place ?p - package ?s - shelf) ;; is package ?p in place ?s
    )

	;; Moves the robot ?r from the location ?x to location ?y
    (:action move
        :parameters (?r - robot ?x - location ?y - location)
        :precondition (and  (at ?r ?x)
                            (not (at ?r ?y)))
        :effect (and (at ?r ?y)
                     (not (at ?r ?x)))
    )
	
	;; Pick up a package
	(:action pick 
		:parameters (?p - package ?r - robot ?l - location)
		:precondition (and (at ?p ?l)
 				           (at ?r ?l)
 				           (available ?p)
                           (forall (?r1 - robot)
                                (not (holding ?r1 ?p))))
		:effect (and (holding ?r ?p)
		             (not (available ?p)))
		
	)

	;; Drops a package
	(:action drop
		:parameters (?p - package ?r - robot  ?l - location)
		:precondition (and (holding ?r ?p))
		:effect (and (not (holding ?r ?p))
					 (available ?p)
					 (at ?p ?l))
	)

    ;; Inserts a small package ?p in a small shelf ?s that is located on ?l
	(:action insert
		:parameters (?r - robot ?p - package ?s - shelf ?si - size ?c - category ?l - location)
		:precondition (and (at ?r ?l)
		                   (at ?s ?l)
		                   (holding ?r ?p)
						   (is-size ?p ?si) 
						   (is-size ?s ?si)
						   (is-category ?p ?c) 
						   (is-category ?s ?c))
		:effect (and (not (holding ?r ?p))
		             (in-place ?p ?s))
	)

	;; Removes a package ?p from location ?l on the shelf ?s
	(:action remove
		:parameters (?r - robot ?p - package ?l - location ?s - shelf)
		:precondition (and (at ?r ?l)
                           (at ?p ?s)
                           (not (available ?p)))
		:effect (and (not (at ?p ?s))
					 (not (in-place ?p ?s))
                     (holding ?r ?p))
    )

)
