(define (problem task)
(:domain skip_door)
(:objects
    wp1 wp2 wp3 - waypoint
    mbot - robot
    door1 door2 door3 - door
)

(:init
    (robot_at mbot wp1)

    (connected wp1 wp2)
    (connected wp2 wp3)

    (door_at door1 wp1)
    (door_at door2 wp2)
    (door_at door3 wp3)

    (door_is_open door1)
)

(:goal (and
            (robot_at mbot wp3)
       )
)

)
