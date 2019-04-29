(define (problem gratek-robots-simple)
(:domain gratek-robots)

    (:objects
        r0
        r1 - robot
        
        p0
        p1 
        p2 
        p3 
        p4 - package
        
        s0 
        s1 
        s2 
        s3 
        s4 
        s5 - shelf
        
        l0            ;; robots location
        l1            ;; packages location
        l2            ;; small shelfs location
        l3            ;; medium shelfs location
        l4 - location ;; big shelfs location
    )
    
    (:init
        ;; Robots location
        (at r0 l0)
        (at r1 l0)
        
        ;; Packages location
        (at p0 l1)
        (at p1 l1)
        (at p2 l1)
        (at p3 l1)
        (at p4 l1)
        
        ;; Small shelfs location
        (at s0 l2)
        (at s1 l2)
        (at s3 l2)
        
        ;; Medium shelfs location
        (at s4 l3)
        
        ;; Big shelfs location
        (at s5 l4)
        
        ;; Available Packages
        (available p0)
        (available p1)
        (available p2)
        (available p3)
        (available p4)
    )
    
    (:goal (and 
                (holding r0 p0)
                (holding r1 p1)
                (at r0 l4)
                (at r1 l4)
            )
    )
)