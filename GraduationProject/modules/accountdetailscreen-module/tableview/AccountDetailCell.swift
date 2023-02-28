//
//  AccountDetailCell.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 26.02.2023.
//

import UIKit

class AccountDetailCell: UITableViewCell {

    static let reuseID = Constants.CellReuseID.accountDetailCell
    static let heightForRowAt: CGFloat = 220
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var orderStateButton: UIButton!
    
    var order: Order?
    
    var cellProtocol: AccountDetailCellProtocol?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(order: Order) {
        self.order = order
        
        if order.orderState == OrderState.allCases.last {
            orderStateButton.isEnabled = false
        } else {
            orderStateButton.isEnabled = true
        }
        orderStateButton.setTitle("\(order.orderState.rawValue)", for: .normal)
        
        setCollectionView()
    }
    
    func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .clear
        
        let layout = UIHelper.createAccountDetailFlowLayout()
        collectionView.collectionViewLayout = layout
    }
    
    @IBAction func orderStateChangeButton(_ sender: Any) {
        guard let indexPath = indexPath else { return }
        cellProtocol?.changeOrderState(indexPath: indexPath)
    }
}

extension AccountDetailCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return order?.orderItems.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OrderItemCell.reuseID, for: indexPath) as? OrderItemCell else { return UICollectionViewCell() }
        guard let order = order else { return UICollectionViewCell() }
        
        cell.setCell(orderItem: order.orderItems[indexPath.item])
        
        return cell
    }
}
