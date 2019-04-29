(define (problem gratek-robots-simple)
(:domain gratek-robots)

    (:objects
        r0 - robot

        c0 - charge

        small
        medium
        big - size

        book
        electronic 
        cleansing - category
        
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

        lc - location ;; recharge location
    )
    
    (:init
        ;; Problem global constants
        (= (total-cost) 0)

        ;; Robots location
        (at r0 l0) 

        ;; Defining properties of the charge point
        (at c0 lc)

        ;; Robots battery level
        (= (battery-level r0) 15)
        
        ;; Defining packages and shelfs size
        (is-size p0 small)
        (is-size p1 small)
        (is-size p2 small)

        (is-size p3 medium)
        (is-size p4 big)

        (is-size s0 small)
        (is-size s1 small)
        (is-size s2 medium)
        (is-size s3 medium)
        (is-size s4 big)
        (is-size s5 big)

        ;; Defining packages and shelfs categories
        (is-category p0 electronic)
        (is-category p1 electronic)
        (is-category p2 book)
        (is-category p3 cleansing)
        (is-category p4 cleansing)

        (is-category s0 electronic)
        (is-category s1 electronic)
        (is-category s2 book)
        (is-category s3 cleansing)
        (is-category s4 book)
        (is-category s5 book)

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
                (in-place p0 s0)
                (in-place p1 s0)
                (in-place p3 s3)
            )
    )
)