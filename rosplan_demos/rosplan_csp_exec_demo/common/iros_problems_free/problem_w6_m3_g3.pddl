(define (problem task)
(:domain robot_delivery)
(:objects
wp0 wp1 wp2 wp3 wp4 wp5 - waypoint
machine0 machine1 machine2 - machine
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

    (delivery_destination wp5)
    (delivery_destination wp3)
    (delivery_destination wp1)

    (= (distance wp0 wp1) 6)
    (= (distance wp1 wp0) 6)
    (= (distance wp0 wp2) 8)
    (= (distance wp2 wp0) 8)
    (= (distance wp0 wp3) 18)
    (= (distance wp3 wp0) 18)
    (= (distance wp0 wp4) 10)
    (= (distance wp4 wp0) 10)
    (= (distance wp0 wp5) 10)
    (= (distance wp5 wp0) 10)
    (= (distance wp1 wp2) 7)
    (= (distance wp2 wp1) 7)
    (= (distance wp1 wp3) 15)
    (= (distance wp3 wp1) 15)
    (= (distance wp1 wp4) 13)
    (= (distance wp4 wp1) 13)
    (= (distance wp1 wp5) 5)
    (= (distance wp5 wp1) 5)
    (= (distance wp2 wp3) 11)
    (= (distance wp3 wp2) 11)
    (= (distance wp2 wp4) 17)
    (= (distance wp4 wp2) 17)
    (= (distance wp2 wp5) 11)
    (= (distance wp5 wp2) 11)
    (= (distance wp3 wp4) 27)
    (= (distance wp4 wp3) 27)
    (= (distance wp3 wp5) 15)
    (= (distance wp5 wp3) 15)
    (= (distance wp4 wp5) 13)
    (= (distance wp5 wp4) 13)
    (= (distance wp0 machine0) 11)
    (= (distance machine0 wp0) 11)
    (= (distance wp0 machine1) 7)
    (= (distance machine1 wp0) 7)
    (= (distance wp0 machine2) 12)
    (= (distance machine2 wp0) 12)
    (= (distance wp1 machine0) 8)
    (= (distance machine0 wp1) 8)
    (= (distance wp1 machine1) 4)
    (= (distance machine1 wp1) 4)
    (= (distance wp1 machine2) 17)
    (= (distance machine2 wp1) 17)
    (= (distance wp2 machine0) 6)
    (= (distance machine0 wp2) 6)
    (= (distance wp2 machine1) 8)
    (= (distance machine1 wp2) 8)
    (= (distance wp2 machine2) 11)
    (= (distance machine2 wp2) 11)
    (= (distance wp3 machine0) 8)
    (= (distance machine0 wp3) 8)
    (= (distance wp3 machine1) 18)
    (= (distance machine1 wp3) 18)
    (= (distance wp3 machine2) 21)
    (= (distance machine2 wp3) 21)
    (= (distance wp4 machine0) 20)
    (= (distance machine0 wp4) 20)
    (= (distance wp4 machine1) 10)
    (= (distance machine1 wp4) 10)
    (= (distance wp4 machine2) 9)
    (= (distance machine2 wp4) 9)
    (= (distance wp5 machine0) 8)
    (= (distance machine0 wp5) 8)
    (= (distance wp5 machine1) 4)
    (= (distance machine1 wp5) 4)
    (= (distance wp5 machine2) 21)
    (= (distance machine2 wp5) 21)
    (= (distance machine0 machine1) 11)
    (= (distance machine1 machine0) 11)
    (= (distance machine0 machine2) 16)
    (= (distance machine2 machine0) 16)
    (= (distance machine1 machine2) 18)
    (= (distance machine2 machine1) 18)
)
(:goal (and
    (order_delivered wp5)
    (order_delivered wp3)
    (order_delivered wp1)
))
)
