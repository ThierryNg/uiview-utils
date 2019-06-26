# uiview-utils
Various UIView extensions, mainly to help with layout

## Layout

These functions add constraints relative to the `superview`, all returning a discardable (`@discardableResult`) array of the resulting constraints :

- `utils_addZeroSpacingConstraints()`
- `utils_addSpacingConstraints(top: CGFloat, left: CGFloat, right: CGFloat, bottom: CGFloat)`
- `utils_addOriginConstraints(top: CGFloat, left: CGFloat)`

- `utils_addWidthConstraint(widthConstant: CGFloat)`
- `utils_addHeightConstraint(heightConstant: CGFloat)`

- `utils_addTopConstraint(topConstant: CGFloat)`
- `utils_addLeftConstraint(leftConstant: CGFloat)`
- `utils_addRightConstraint(rightConstant: CGFloat)`
- `utils_addBottomConstraint(bottomConstant: CGFloat)`

(the following `relation` parameter defaults to `.equal`)
- `utils_addConstraint(attribute: NSLayoutConstraint.Attribute, relation: NSLayoutConstraint.Relation, constant: CGFloat)`

## Borders

This extension in `UIView+Borders.swift` provides a utility func to add a border on only one side of a `UIView`, selected by enum

Example usage :
`self.exampleView.addBorder(side: .bottom, color: self.borderColor, thickness: 1)`
