//
//  FeedItemCellNode.swift
//  LayoutKit
//
//  Created by Adlai Holler on 8/24/16.
//  Copyright © 2016 LinkedIn. All rights reserved.
//

import AsyncDisplayKit


/// A LinkedIn feed item that is implemented with AsyncDisplayKit
final class FeedItemCellNode: ASCellNode, DataBinder {
	
	let actionNode = ASTextNode()
	let optionsNode = ASTextNode()
	let posterImageNode = ASImageNode()
	let posterHeadlineNode = ASTextNode()
	let posterTimeNode = ASTextNode()
	let posterNameNode = ASTextNode()
	let posterCommentNode = ASTextNode()
	let contentImageNode = ASImageNode()
	let contentTitleNode = ASTextNode()
	let contentDomainNode = ASTextNode()
	let likeNode = ASTextNode()
	let commentNode = ASTextNode()
	let shareNode = ASTextNode()
	let actorImageNode = ASImageNode()
	let actorCommentNode = ASTextNode()
	
	override init() {
		super.init()
		usesImplicitHierarchyManagement = true
		optionsNode.attributedText = optionsLabelText
		commentNode.backgroundColor = commentBGColor
		commentNode.attributedText = commentLabelText
		shareNode.backgroundColor = shareBGColor
		shareNode.attributedText = shareLabelText
		likeNode.backgroundColor = likeBGColor
		likeNode.attributedText = likeLabelText
	}
	
	func setData(data: FeedItemData) {
		actionNode.attributedText = NSAttributedString(string: data.actionText)
		posterNameNode.attributedText = NSAttributedString(string: data.posterName)
		posterHeadlineNode.attributedText = NSAttributedString(string: data.posterHeadline)
		posterTimeNode.attributedText = NSAttributedString(string: data.posterTimestamp)
		posterCommentNode.attributedText = NSAttributedString(string: data.posterComment)
		contentTitleNode.attributedText = NSAttributedString(string: data.contentTitle)
		contentDomainNode.attributedText = NSAttributedString(string: data.contentDomain)
		actorCommentNode.attributedText = NSAttributedString(string: data.actorComment)
		// Pretend these are dynamic images
		actorImageNode.image = UIImage(named: "50x50.png")
		posterImageNode.image = UIImage(named: "50x50.png")
		contentImageNode.image = UIImage(named: "350x200.png")
	}
	
	override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
		return ASStackLayoutSpec(
			direction: .Vertical,
			spacing: 4,
			justifyContent: .Start,
			alignItems: .Stretch,
			children: [
				ASStackLayoutSpec(
					direction: .Horizontal,
					spacing: 0,
					justifyContent: .SpaceBetween,
					alignItems: .Center,
					children: [ actionNode, optionsNode ]),
				ASStackLayoutSpec(
					direction: .Horizontal,
					spacing: 8,
					justifyContent: .Start,
					alignItems: .Center,
					children: [
					posterImageNode,
					ASStackLayoutSpec(
						direction: .Vertical,
						spacing: 0,
						justifyContent: .SpaceBetween,
						alignItems: .Start,
						children: [
							posterNameNode,
							posterHeadlineNode,
							posterTimeNode ]) ]),
				posterCommentNode,
				contentImageNode,
				contentTitleNode,
				contentDomainNode,
				ASStackLayoutSpec(
					direction: .Horizontal,
					spacing: 0,
					justifyContent: .SpaceBetween,
					alignItems: .Center,
					children: [ likeNode, commentNode, shareNode ]),
				ASStackLayoutSpec(
					direction: .Horizontal,
					spacing: 8,
					justifyContent: .Start,
					alignItems: .Center,
					children: [ actorImageNode, actorCommentNode ]),
			])
	}
}

private let commentBGColor = UIColor(red: 0, green: 1.0, blue: 0, alpha: 1)
private let shareBGColor = UIColor(red: 0, green: 0.8, blue: 0, alpha: 1)
private let likeBGColor = UIColor(red: 0, green: 0.9, blue: 0, alpha: 1)
private let commentLabelText = NSAttributedString(string: "Comment")

private let likeLabelText = NSAttributedString(string: "Like")
private let optionsLabelText = NSAttributedString(string: "...")

private let shareLabelText = NSAttributedString(string: "Share")