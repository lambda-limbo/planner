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

		(is-placeable ?p -package ?s - shelf) ;; is the package ?p placable in the shelf ?s

		(is-package-small ?p - package)     ;; is the package ?p small? 
		(is-package-medium ?p - package)    ;; is the package ?p medium?
		(is-package-big ?p - package)       ;; is the package ?p big?
		
        (is-shelf-small ?s - shelf)
		(is-shelf-medium ?s - shelf)
		(is-shelf-big ?s - shelf)

		;;(is-package ?t - type ?p - package)
		;;(is-location ?t - type ?l - location)
		;;(storage-area ?t - type)
		
		(in-place ?p - package ?s - shelf) ;; is package ?p in place ?s
    )
    
    ;; FIXME: Maybe use derived predicates https://nergmada.github.io/pddl-reference/reference/PDDL2.2/domain.html#derived-predicates
    ;;(:derived (is-small ?p - package ?s - shelf)
    ;;    (and 
    ;;        (is-package-small ?p)
    ;;        (is-shelf-small ?p)
    ;;    )
    ;;)

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
		:precondition ()
		:effect (and (not (holding ?)))
	)

    ;; Inserts a small package ?p in a small shelf ?s that is located on ?l
	(:action insert
		:parameters (?r - robot ?p - package ?s - shelf ?l - location)
		:precondition (and (is-shelf-small ?s)
		                   (is-package-small ?p)
		                   (at ?r ?l)
		                   (at ?s ?l)
						   
		                   (holding ?r ?p))
		:effect (and (not (holding ?r ?p))
		             (in-place ?p ?s)
		             (available ?p))
	)

	;; Removes a package ?p from location ?l on the shelf ?s
	(:action remove
		:parameters (?r - robot ?p - package ?l - location ?s - shelf)
		:precondition (and (at ?r ?l)
                           (at ?p ?s))
		:effect (and (not (at ?p ?s))
                     (holding ?r ?p))
    )

)
