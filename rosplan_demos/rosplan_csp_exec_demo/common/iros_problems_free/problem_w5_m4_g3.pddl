(define (problem task)
(:domain robot_delivery)
(:objects
wp0 wp1 wp2 wp3 wp4 - waypoint
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

    (delivery_destination wp4)
    (delivery_destination wp2)
    (delivery_destination wp0)

    (= (distance wp0 wp1) 11)
    (= (distance wp1 wp0) 11)
    (= (distance wp0 wp2) 18)
    (= (distance wp2 wp0) 18)
    (= (distance wp0 wp3) 1)
    (= (distance wp3 wp0) 1)
    (= (distance wp0 wp4) 23)
    (= (distance wp4 wp0) 23)
    (= (distance wp1 wp2) 16)
    (= (distance wp2 wp1) 16)
    (= (distance wp1 wp3) 11)
    (= (distance wp3 wp1) 11)
    (= (distance wp1 wp4) 29)
    (= (distance wp4 wp1) 29)
    (= (distance wp2 wp3) 18)
    (= (distance wp3 wp2) 18)
    (= (distance wp2 wp4) 20)
    (= (distance wp4 wp2) 20)
    (= (distance wp3 wp4) 23)
    (= (distance wp4 wp3) 23)
    (= (distance wp0 machine0) 5)
    (= (distance machine0 wp0) 5)
    (= (distance wp0 machine1) 20)
    (= (distance machine1 wp0) 20)
    (= (distance wp0 machine2) 4)
    (= (distance machine2 wp0) 4)
    (= (distance wp0 machine3) 24)
    (= (distance machine3 wp0) 24)
    (= (distance wp1 machine0) 15)
    (= (distance machine0 wp1) 15)
    (= (distance wp1 machine1) 26)
    (= (distance machine1 wp1) 26)
    (= (distance wp1 machine2) 10)
    (= (distance machine2 wp1) 10)
    (= (distance wp1 machine3) 30)
    (= (distance machine3 wp1) 30)
    (= (distance wp2 machine0) 22)
    (= (distance machine0 wp2) 22)
    (= (distance wp2 machine1) 11)
    (= (distance machine1 wp2) 11)
    (= (distance wp2 machine2) 15)
    (= (distance machine2 wp2) 15)
    (= (distance wp2 machine3) 15)
    (= (distance machine3 wp2) 15)
    (= (distance wp3 machine0) 5)
    (= (distance machine0 wp3) 5)
    (= (distance wp3 machine1) 20)
    (= (distance machine1 wp3) 20)
    (= (distance wp3 machine2) 4)
    (= (distance machine2 wp3) 4)
    (= (distance wp3 machine3) 24)
    (= (distance machine3 wp3) 24)
    (= (distance wp4 machine0) 19)
    (= (distance machine0 wp4) 19)
    (= (distance wp4 machine1) 10)
    (= (distance machine1 wp4) 10)
    (= (distance wp4 machine2) 20)
    (= (distance machine2 wp4) 20)
    (= (distance wp4 machine3) 8)
    (= (distance machine3 wp4) 8)
    (= (distance machine0 machine1) 16)
    (= (distance machine1 machine0) 16)
    (= (distance machine0 machine2) 8)
    (= (distance machine2 machine0) 8)
    (= (distance machine0 machine3) 20)
    (= (distance machine3 machine0) 20)
    (= (distance machine1 machine2) 17)
    (= (distance machine2 machine1) 17)
    (= (distance machine1 machine3) 5)
    (= (distance machine3 machine1) 5)
    (= (distance machine2 machine3) 21)
    (= (distance machine3 machine2) 21)
)
(:goal (and
    (order_delivered wp4)
    (order_delivered wp2)
    (order_delivered wp0)
))
)
