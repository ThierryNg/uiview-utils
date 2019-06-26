//
//  UIView+Constraints.swift
//
//  Created by Thierry Ng on 08/07/2018.
//  Copyright © 2018 Thierry Ng. All rights reserved.
//

import UIKit

@available(swift 4.2)
extension UIView {

    @discardableResult func utils_addZeroSpacingConstraints() -> [NSLayoutConstraint] {
        return utils_addSpacingConstraints(top: 0, left: 0, right: 0, bottom: 0)
    }

    @discardableResult func utils_addSpacingConstraints(top: CGFloat,
                                                        left: CGFloat,
                                                        right: CGFloat,
                                                        bottom: CGFloat) -> [NSLayoutConstraint] {
        var constraints = utils_addOriginConstraints(top: top, left: left)
        guard constraints.count == 2 else {
            return []
        }

        if let rightConstraint = utils_addRightConstraint(rightConstant: right) {
            constraints.append(rightConstraint)
        }
        if let bottomConstraint = utils_addBottomConstraint(bottomConstant: bottom) {
            constraints.append(bottomConstraint)
        }

        return constraints
    }

    @discardableResult func utils_addOriginConstraints (top: CGFloat, left: CGFloat) -> [NSLayoutConstraint] {
        guard self.superview != nil else {
            return []
        }
        var result = [NSLayoutConstraint]()

        if let top = utils_addTopConstraint(topConstant: top) {
            result.append(top)
        }
        if let left = utils_addLeftConstraint(leftConstant: left) {
            result.append(left)
        }
        return result
    }

    /// Adds a top spacing constraint against the superview
    /// returning the newly created constraint
    @discardableResult func utils_addTopConstraint(topConstant: CGFloat) -> NSLayoutConstraint? {
        return self.utils_addConstraint(attribute: .top, constant: topConstant)
    }

    @discardableResult func utils_addLeftConstraint(leftConstant: CGFloat) -> NSLayoutConstraint? {
        return self.utils_addConstraint(attribute: .left, constant: leftConstant)
    }

    @discardableResult func utils_addRightConstraint(rightConstant: CGFloat) -> NSLayoutConstraint? {
        return self.utils_addConstraint(attribute: .right, constant: rightConstant)
    }

    @discardableResult func utils_addBottomConstraint(bottomConstant: CGFloat) -> NSLayoutConstraint? {
        return self.utils_addConstraint(attribute: .bottom, constant: bottomConstant)
    }

    @discardableResult func utils_addWidthConstraint(widthConstant: CGFloat) -> NSLayoutConstraint? {
        return self.utils_addConstraint(attribute: .width, constant:widthConstant)
    }

    @discardableResult func utils_addHeightConstraint(heightConstant: CGFloat) -> NSLayoutConstraint? {
        return self.utils_addConstraint(attribute: .height, constant:heightConstant)
    }

    #if swift(>=4.2)
    @discardableResult func utils_addConstraint(attribute: NSLayoutConstraint.Attribute, relation: NSLayoutConstraint.Relation = .equal, constant: CGFloat) -> NSLayoutConstraint? {
    guard let superview = self.superview else {
    return nil
    }

    self.translatesAutoresizingMaskIntoConstraints = false

    let constraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: relation, toItem: superview, attribute: attribute, multiplier: 1.0, constant: constant)

    superview.addConstraint(constraint)
    return constraint
    }
    #else
    @discardableResult func utils_addConstraint(attribute: NSLayoutAttribute, relation: NSLayoutRelation = .equal, constant: CGFloat) -> NSLayoutConstraint? {
    guard let superview = self.superview else {
    return nil
    }

    self.translatesAutoresizingMaskIntoConstraints = false

    let constraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: relation, toItem: superview, attribute: attribute, multiplier: 1.0, constant: constant)

    superview.addConstraint(constraint)
    return constraint
    }
    #endif
}
