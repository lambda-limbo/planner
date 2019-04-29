(define (problem gratek-robots-complex)
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
        p4
        p5
        p6
        p7
        p8
        p9
        p10
        p11
        p12
        p13
        p14
        p15
        p16
        p17
        p18
        p19
        p20
        p21
        p22
        p23
        p24 - package
        
        s0 
        s1 
        s2 
        s3 
        s4 
        s5
        s6
        s7
        s8
        s9
        s10
        s11 - shelf
        
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

        ;; Defining properties of the carge point
        (at c0 lc)

        ;; Robots battery level
        (= (battery-level r0) 15)

        ;; Defining packages and shelfs size
        (is-size p0 small)
        (is-size p1 medium)
        (is-size p2 small)
        (is-size p3 big)
        (is-size p4 medium)
        (is-size p5 small)
        (is-size p6 big)
        (is-size p7 big)
        (is-size p8 medium)
        (is-size p9 big)
        (is-size p10 big)
        (is-size p11 big)
        (is-size p12 small)
        (is-size p13 small)
        (is-size p14 medium)
        (is-size p15 small)
        (is-size p16 big)
        (is-size p17 medium)
        (is-size p18 small)
        (is-size p19 big)
        (is-size p20 small)
        (is-size p21 medium)
        (is-size p22 medium)
        (is-size p23 big)
        (is-size p24 small)

        (is-size s0 small)
        (is-size s1 small)
        (is-size s2 small)
        (is-size s3 medium)
        (is-size s4 medium)
        (is-size s5 medium)
        (is-size s6 medium)
        (is-size s7 big)
        (is-size s8 big)
        (is-size s9 big)
        (is-size s10 big)
        (is-size s11 big)

        ;; Defining packages and shelfs categories
        (is-category p0 electronic)
        (is-category p1 electronic)
        (is-category p2 electronic)
        (is-category p3 electronic)
        (is-category p4 electronic)
        (is-category p5 electronic)
        (is-category p6 electronic)
        (is-category p7 electronic)
        (is-category p8 electronic)
        (is-category p9 electronic)
        (is-category p10 electronic)
        (is-category p11 electronic)
        (is-category p12 electronic)
        (is-category p13 book)
        (is-category p14 cleansing)
        (is-category p15 cleansing)
        (is-category p16 book)
        (is-category p17 book)
        (is-category p18 book)
        (is-category p19 cleansing)
        (is-category p20 cleansing)
        (is-category p21 book)
        (is-category p22 book)
        (is-category p23 book)
        (is-category p24 cleansing)

        (is-category s0 cleansing)
        (is-category s1 book)
        (is-category s2 electronic)
        (is-category s3 book)
        (is-category s4 electronic)
        (is-category s5 book)
        (is-category s6 cleansing)
        (is-category s7 electronic)
        (is-category s8 book)
        (is-category s9 electronic)
        (is-category s10 cleansing)
        (is-category s11 electronic)

        ;; Packages location
        (at p0 l1)
        (at p1 l1)
        (at p2 l1)
        (at p3 l1)
        (at p4 l1)
        (at p5 l1)
        (at p6 l1)
        (at p7 l1)
        (at p8 l1)
        (at p9 l1)
        (at p10 l1)
        (at p11 l1)
        (at p12 l1)
        (at p13 l1)
        (at p14 l1)
        (at p15 l1)
        (at p16 l1)
        (at p17 l1)
        (at p18 l1)
        (at p19 l1)
        (at p20 l1)
        (at p21 l1)
        (at p22 l1)
        (at p23 l1)
        (at p24 l1)
        
        ;; Small shelfs location
        (at s0 l2)
        (at s1 l2)
        (at s2 l2)
        
        ;; Medium shelfs location
        (at s3 l3)
        (at s4 l3)
        (at s5 l3)
        (at s6 l3)
        
        ;; Big shelfs location
        (at s7 l4)
        (at s8 l4)
        (at s9 l4)
        (at s10 l4)
        (at s11 l4)
        
        ;; Available Packages
        (available p0)
        (available p1)
        (available p2)
        (available p3)
        (available p4)
        (available p5)
        (available p6)
        (available p7)
        (available p8)
        (available p9)
        (available p10)
        (available p11)
        (available p12)
        (available p13)
        (available p14)
        (available p15)
        (available p16)
        (available p17)
        (available p18)
        (available p19)
        (available p20)
        (available p21)
        (available p22)
        (available p23)
        (available p24)
    )
    
    (:goal (and 
                (in-place p0 s2)
                (in-place p1 s4)
                (in-place p2 s2)
                (in-place p3 s9)
                (in-place p4 s4)
                (in-place p5 s2)
                (in-place p6 s9)
                (in-place p7 s9)
                (in-place p8 s4)
                (in-place p9 s11)
                (in-place p10 s11)
                (in-place p11 s7)
                (in-place p12 s2)
                (in-place p13 s1)
                (in-place p14 s6)
                (in-place p15 s0)
                (in-place p16 s8)
                (in-place p17 s3)
                (in-place p18 s1)
                (in-place p19 s10)
                (in-place p20 s0)
                (in-place p21 s5)
                (in-place p22 s3)
                (in-place p23 s8)
                (in-place p24 s0)
            )
    )
)