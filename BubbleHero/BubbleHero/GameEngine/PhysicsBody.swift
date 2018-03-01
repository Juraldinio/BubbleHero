//
//  PhysicsBody.swift
//  BubbleHero
//
//  Created by Yunpeng Niu on 28/02/18.
//  Copyright © 2018 Yunpeng Niu. All rights reserved.
//

import UIKit

/**
 `PhysicsBody` defines some basic physical properties that objects managed by
 the physics engine should minimally satisfy:

 1. The object is modelled as a perfect circle. Thus, all `PhysicsBody`s have
 the same shape.
 2. Each object has its own independent position, velocity and acceleration.
 The position is referred as the center of the circle.
 3. The object does not have a mass or volumn because it is a 2D idealized object.
 4. The object can optionally be a rigid body. Collision can only happen between
 two rigid bodies.
 5. In this imaginary world, `PhysicsBody` is sticky, i.e., it can be "attached"
 to other `PhysicsBody`s. Notice that "attachment" should be double-way for it to
 make sense, i.e, A is attached to B implies B is attached to A.

 - Author: Niu Yunpeng @ CS3217
 - Date: Feb 2018
 */
protocol PhysicsBody: AnyObject {
    /// The current acceleration of the `PhysicsBody`.
    var acceleration: CGVector { get set }
    /// The current speed of the `PhysicsBody`.
    var speed: CGVector { get set }
    /// The coordinate of the center of the `PhysicsBody`.
    var center: CGPoint { get set }
    /// The radius of the `PhysicsBody`.
    var radius: CGFloat { get }
    /// Indiciates whether the `PhysicsBody` is a rigid body.
    var isRigidBody: Bool { get }

    /// Moves the `PhysicsBody` by its current speed. If the current acceleration is
    /// not 0, its speed will be changed accordingly as well. Notice that this method
    /// should be called per frame.
    func move()

    /// Moves the `PhysicsBody` by a certain vector. For example, if its current position
    /// is (x, y), moving by (dx, dy) will change it to (x + dx, y + dy). However, the
    /// vector does not have to be positive.
    /// - Parameter delta: The change in its coordinate.
    func move(by delta: CGVector)

    /// Moves the `PhysicsBody` to a certain point.
    /// - Parameter point: The new position of the `PhysicsBody`.
    func move(to point: CGPoint)

    /// Stops a `GameObject` by setting its speed and acceleration both to (0, 0).
    func stop()

    /// Applies an instantaneous brake to the `GameObject` by settings its speed to (0, 0)
    /// without affecting its acceleration.
    func brake()

    /// Checks whether this `PhysicsBody` did collide with another `PhysicsBody`. Notice
    /// that only two rigid bodies will collide with each other.
    /// - Parameter object: The other `PhysicsBody`.
    /// - Returns: true if they will collide; false otherwise.
    func didCollideWith(_ object: PhysicsBody) -> Bool

    /// The handler when the `PhysicsBody` collides with others.
    /// - Parameter object: The other `PhysicsBody` collided with; nil if we do not know.
    func onCollideWith(_ object: PhysicsBody?)

    /// Attachs this `PhysicsBody` to another `PhysicsBody`.
    func attachTo(_ object: PhysicsBody)

    /// Checks whether this `PhysicsBody` is attached to another `PhysicsBody`.
    func isAttachedTo(_ object: PhysicsBody) -> Bool

    /// Reverses the x-component of the speed to simulate a horizontal "reflect".
    func reflectX()

    /// Reverses the y-component of the speed to simulate a vertical "reflect".
    func reflectY()

    /// Indicates whether a `GameObject` is static by checking whether its current speed
    /// and acceleration are both (0, 0).
    var isStatic: Bool { get }
}