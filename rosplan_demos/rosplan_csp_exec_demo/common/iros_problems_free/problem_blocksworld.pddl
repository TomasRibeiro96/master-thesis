(define (problem BLOCKS)
(:domain BLOCKS)
(:objects D B A C - block)
(:init (clear C) (clear A) (clear B) (clear D) (ontable C) (ontable A)
 (ontable B) (ontable D) (handempty))
(:goal (and (on D C) (on C B) (on B A)))
)