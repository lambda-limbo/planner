(define (domain gratek-robots)

	(:requirements 
	    :adl 
	    :typing 
	    :equality 
	    :negative-preconditions)
	
	(:types location 
	        robot 		;; the robot
	        package 	;; a package
	        shelf 		;; a shelf
			charge		;; a recharge point
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

	(:functions
		(total-cost)				- number ;; Total cost of the planning
		(battery-level ?r - robot)	- number ;; The current battery level for a robot ?c
		(placing-cost ?s - shelf)	- number ;; The cost of placing an item on the shelf ?s
	)

	;; Moves the robot ?r from the location ?x to location ?y
    (:action move
        :parameters (?r - robot ?x - location ?y - location)
        :precondition (and  (at ?r ?x)
                            (not (at ?r ?y))
							(> (battery-level ?r) 1))
        :effect (and (at ?r ?y)
                     (not (at ?r ?x))
					 (increase (total-cost) 1)
					 (decrease (battery-level ?r) 1))
    )
	
	;; Pick up a package
	(:action pick 
		:parameters (?p - package ?r - robot ?l - location)
		:precondition (and (at ?p ?l)
 				           (at ?r ?l)
 				           (available ?p)
						   (> (battery-level ?r) 2)
                           (forall (?r1 - robot)
                                (not (holding ?r1 ?p))))
		:effect (and (holding ?r ?p)
		             (not (available ?p))
					 (increase (total-cost) 1)
					 (decrease (battery-level ?r) 2))
		
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
						   (is-category ?s ?c)
						   (> (battery-level ?r) 3))
		:effect (and (not (holding ?r ?p))
		             (in-place ?p ?s)
					 (increase (total-cost) 2)
					 (decrease (battery-level ?r) 3))
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

	;; Recharges a robot's battery
	(:action recharge
		:parameters (?r - robot ?c - charge ?l - location)
		:precondition (and (at ?r ?l)
						   (at ?c ?l)
						   (<= (battery-level ?r) 7))
		:effect (and (increase (battery-level ?r) 10)
					 (increase (total-cost) 3))
	)
)
