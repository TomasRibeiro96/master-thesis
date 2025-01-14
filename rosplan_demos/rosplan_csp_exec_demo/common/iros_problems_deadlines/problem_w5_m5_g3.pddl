(define (problem task)
(:domain robot_delivery)
(:objects
wp0 wp1 wp2 wp3 wp4 - waypoint
machine0 machine1 machine2 machine3 machine4 - machine
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
    (machine_off machine4)

    (delivery_destination wp4) (at 189 (not (delivery_destination wp4)))
    (delivery_destination wp2) (at 189 (not (delivery_destination wp2)))
    (delivery_destination wp3) (at 189 (not (delivery_destination wp3)))

    (= (distance wp0 wp1) 8)
    (= (distance wp1 wp0) 8)
    (= (distance wp0 wp2) 10)
    (= (distance wp2 wp0) 10)
    (= (distance wp0 wp3) 9)
    (= (distance wp3 wp0) 9)
    (= (distance wp0 wp4) 18)
    (= (distance wp4 wp0) 18)
    (= (distance wp1 wp2) 7)
    (= (distance wp2 wp1) 7)
    (= (distance wp1 wp3) 6)
    (= (distance wp3 wp1) 6)
    (= (distance wp1 wp4) 17)
    (= (distance wp4 wp1) 17)
    (= (distance wp2 wp3) 2)
    (= (distance wp3 wp2) 2)
    (= (distance wp2 wp4) 17)
    (= (distance wp4 wp2) 17)
    (= (distance wp3 wp4) 18)
    (= (distance wp4 wp3) 18)
    (= (distance wp0 machine0) 12)
    (= (distance machine0 wp0) 12)
    (= (distance wp0 machine1) 11)
    (= (distance machine1 wp0) 11)
    (= (distance wp0 machine2) 10)
    (= (distance machine2 wp0) 10)
    (= (distance wp0 machine3) 11)
    (= (distance machine3 wp0) 11)
    (= (distance wp0 machine4) 11)
    (= (distance machine4 wp0) 11)
    (= (distance wp1 machine0) 9)
    (= (distance machine0 wp1) 9)
    (= (distance wp1 machine1) 14)
    (= (distance machine1 wp1) 14)
    (= (distance wp1 machine2) 17)
    (= (distance machine2 wp1) 17)
    (= (distance wp1 machine3) 4)
    (= (distance machine3 wp1) 4)
    (= (distance wp1 machine4) 8)
    (= (distance machine4 wp1) 8)
    (= (distance wp2 machine0) 3)
    (= (distance machine0 wp2) 3)
    (= (distance wp2 machine1) 20)
    (= (distance machine1 wp2) 20)
    (= (distance wp2 machine2) 17)
    (= (distance machine2 wp2) 17)
    (= (distance wp2 machine3) 10)
    (= (distance machine3 wp2) 10)
    (= (distance wp2 machine4) 4)
    (= (distance machine4 wp2) 4)
    (= (distance wp3 machine0) 4)
    (= (distance machine0 wp3) 4)
    (= (distance wp3 machine1) 19)
    (= (distance machine1 wp3) 19)
    (= (distance wp3 machine2) 18)
    (= (distance machine2 wp3) 18)
    (= (distance wp3 machine3) 9)
    (= (distance machine3 wp3) 9)
    (= (distance wp3 machine4) 5)
    (= (distance machine4 wp3) 5)
    (= (distance wp4 machine0) 19)
    (= (distance machine0 wp4) 19)
    (= (distance wp4 machine1) 28)
    (= (distance machine1 wp4) 28)
    (= (distance wp4 machine2) 11)
    (= (distance machine2 wp4) 11)
    (= (distance wp4 machine3) 20)
    (= (distance machine3 wp4) 20)
    (= (distance wp4 machine4) 14)
    (= (distance machine4 wp4) 14)
    (= (distance machine0 machine1) 22)
    (= (distance machine1 machine0) 22)
    (= (distance machine0 machine2) 19)
    (= (distance machine2 machine0) 19)
    (= (distance machine0 machine3) 12)
    (= (distance machine3 machine0) 12)
    (= (distance machine0 machine4) 6)
    (= (distance machine4 machine0) 6)
    (= (distance machine1 machine2) 18)
    (= (distance machine2 machine1) 18)
    (= (distance machine1 machine3) 11)
    (= (distance machine3 machine1) 11)
    (= (distance machine1 machine4) 21)
    (= (distance machine4 machine1) 21)
    (= (distance machine2 machine3) 20)
    (= (distance machine3 machine2) 20)
    (= (distance machine2 machine4) 14)
    (= (distance machine4 machine2) 14)
    (= (distance machine3 machine4) 11)
    (= (distance machine4 machine3) 11)
)
(:goal (and
    (order_delivered wp4)
    (order_delivered wp2)
    (order_delivered wp3)
))
)
