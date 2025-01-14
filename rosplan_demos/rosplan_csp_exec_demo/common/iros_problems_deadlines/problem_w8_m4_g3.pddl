(define (problem task)
(:domain robot_delivery)
(:objects
wp0 wp1 wp2 wp3 wp4 wp5 wp6 wp7 - waypoint
machine0 machine1 machine2 machine3 - machine
robot0 robot1 robot2 - robot
)
(:init
    (robot_at robot0 wp0)
    (nocarrying_order robot0)
    (undocked robot0)
    (localised robot0)

    (robot_at robot1 wp0)
    (nocarrying_order robot1)
    (undocked robot1)
    (localised robot1)

    (robot_at robot2 wp0)
    (nocarrying_order robot2)
    (undocked robot2)
    (localised robot2)

    (machine_off machine0)
    (machine_off machine1)
    (machine_off machine2)
    (machine_off machine3)

    (delivery_destination wp0) (at 270 (not (delivery_destination wp0)))
    (delivery_destination wp1) (at 270 (not (delivery_destination wp1)))
    (delivery_destination wp4) (at 270 (not (delivery_destination wp4)))

    (= (distance wp0 wp1) 31)
    (= (distance wp1 wp0) 31)
    (= (distance wp0 wp2) 20)
    (= (distance wp2 wp0) 20)
    (= (distance wp0 wp3) 30)
    (= (distance wp3 wp0) 30)
    (= (distance wp0 wp4) 16)
    (= (distance wp4 wp0) 16)
    (= (distance wp0 wp5) 10)
    (= (distance wp5 wp0) 10)
    (= (distance wp0 wp6) 18)
    (= (distance wp6 wp0) 18)
    (= (distance wp0 wp7) 18)
    (= (distance wp7 wp0) 18)
    (= (distance wp1 wp2) 12)
    (= (distance wp2 wp1) 12)
    (= (distance wp1 wp3) 20)
    (= (distance wp3 wp1) 20)
    (= (distance wp1 wp4) 16)
    (= (distance wp4 wp1) 16)
    (= (distance wp1 wp5) 22)
    (= (distance wp5 wp1) 22)
    (= (distance wp1 wp6) 14)
    (= (distance wp6 wp1) 14)
    (= (distance wp1 wp7) 26)
    (= (distance wp7 wp1) 26)
    (= (distance wp2 wp3) 15)
    (= (distance wp3 wp2) 15)
    (= (distance wp2 wp4) 5)
    (= (distance wp4 wp2) 5)
    (= (distance wp2 wp5) 11)
    (= (distance wp5 wp2) 11)
    (= (distance wp2 wp6) 5)
    (= (distance wp6 wp2) 5)
    (= (distance wp2 wp7) 21)
    (= (distance wp7 wp2) 21)
    (= (distance wp3 wp4) 15)
    (= (distance wp4 wp3) 15)
    (= (distance wp3 wp5) 21)
    (= (distance wp5 wp3) 21)
    (= (distance wp3 wp6) 19)
    (= (distance wp6 wp3) 19)
    (= (distance wp3 wp7) 13)
    (= (distance wp7 wp3) 13)
    (= (distance wp4 wp5) 7)
    (= (distance wp5 wp4) 7)
    (= (distance wp4 wp6) 9)
    (= (distance wp6 wp4) 9)
    (= (distance wp4 wp7) 17)
    (= (distance wp7 wp4) 17)
    (= (distance wp5 wp6) 13)
    (= (distance wp6 wp5) 13)
    (= (distance wp5 wp7) 13)
    (= (distance wp7 wp5) 13)
    (= (distance wp6 wp7) 25)
    (= (distance wp7 wp6) 25)
    (= (distance wp0 machine0) 10)
    (= (distance machine0 wp0) 10)
    (= (distance wp0 machine1) 20)
    (= (distance machine1 wp0) 20)
    (= (distance wp0 machine2) 28)
    (= (distance machine2 wp0) 28)
    (= (distance wp0 machine3) 19)
    (= (distance machine3 wp0) 19)
    (= (distance wp1 machine0) 22)
    (= (distance machine0 wp1) 22)
    (= (distance wp1 machine1) 12)
    (= (distance machine1 wp1) 12)
    (= (distance wp1 machine2) 12)
    (= (distance machine2 wp1) 12)
    (= (distance wp1 machine3) 13)
    (= (distance machine3 wp1) 13)
    (= (distance wp2 machine0) 13)
    (= (distance machine0 wp2) 13)
    (= (distance wp2 machine1) 9)
    (= (distance machine1 wp2) 9)
    (= (distance wp2 machine2) 9)
    (= (distance machine2 wp2) 9)
    (= (distance wp2 machine3) 12)
    (= (distance machine3 wp2) 12)
    (= (distance wp3 machine0) 21)
    (= (distance machine0 wp3) 21)
    (= (distance wp3 machine1) 23)
    (= (distance machine1 wp3) 23)
    (= (distance wp3 machine2) 9)
    (= (distance machine2 wp3) 9)
    (= (distance wp3 machine3) 26)
    (= (distance machine3 wp3) 26)
    (= (distance wp4 machine0) 9)
    (= (distance machine0 wp4) 9)
    (= (distance wp4 machine1) 13)
    (= (distance machine1 wp4) 13)
    (= (distance wp4 machine2) 13)
    (= (distance machine2 wp4) 13)
    (= (distance wp4 machine3) 16)
    (= (distance machine3 wp4) 16)
    (= (distance wp5 machine0) 5)
    (= (distance machine0 wp5) 5)
    (= (distance wp5 machine1) 17)
    (= (distance machine1 wp5) 17)
    (= (distance wp5 machine2) 19)
    (= (distance machine2 wp5) 19)
    (= (distance wp5 machine3) 20)
    (= (distance machine3 wp5) 20)
    (= (distance wp6 machine0) 17)
    (= (distance machine0 wp6) 17)
    (= (distance wp6 machine1) 5)
    (= (distance machine1 wp6) 5)
    (= (distance wp6 machine2) 11)
    (= (distance machine2 wp6) 11)
    (= (distance wp6 machine3) 8)
    (= (distance machine3 wp6) 8)
    (= (distance wp7 machine0) 9)
    (= (distance machine0 wp7) 9)
    (= (distance wp7 machine1) 29)
    (= (distance machine1 wp7) 29)
    (= (distance wp7 machine2) 15)
    (= (distance machine2 wp7) 15)
    (= (distance wp7 machine3) 32)
    (= (distance machine3 wp7) 32)
    (= (distance machine0 machine1) 21)
    (= (distance machine1 machine0) 21)
    (= (distance machine0 machine2) 19)
    (= (distance machine2 machine0) 19)
    (= (distance machine0 machine3) 24)
    (= (distance machine3 machine0) 24)
    (= (distance machine1 machine2) 15)
    (= (distance machine2 machine1) 15)
    (= (distance machine1 machine3) 4)
    (= (distance machine3 machine1) 4)
    (= (distance machine2 machine3) 18)
    (= (distance machine3 machine2) 18)
)
(:goal (and
    (order_delivered wp0)
    (order_delivered wp1)
    (order_delivered wp4)
))
)
