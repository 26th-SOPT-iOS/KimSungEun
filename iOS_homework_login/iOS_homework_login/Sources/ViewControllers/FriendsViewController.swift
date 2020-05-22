//
//  FriendsViewController.swift
//  iOS_homework_login
//
//  Created by 김성은 on 15/05/2020.
//  Copyright © 2020 김성은. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet weak var friendsTableView: UITableView!
    
    private var friendsList: [FriendInformation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        friendsTableView.separatorStyle = .none
        
        setFriendInformations()
        friendsTableView.dataSource = self
        friendsTableView.delegate = self
    }
    
    @IBAction func settingButton(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "친구 관리", style: .default) { _ in
            //
        })

        alert.addAction(UIAlertAction(title: "전체 설정", style: .default) { _ in
            //
        })
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))

        present(alert, animated: true)
    }
    
    private func setFriendInformations() {
        let friend1 = FriendInformation(imageName: "hyungman", name: "아빠", status: "")
        let friend2 = FriendInformation(imageName: "bong", name: "엄마", status: "")
        let friend3 = FriendInformation(imageName: "jjang_a", name: "짱아", status: "오빠 팔아요")
        let friend4 = FriendInformation(imageName: "chulsu", name: "철수", status: "")
        let friend5 = FriendInformation(imageName: "yuri", name: "유리", status: "소꿉놀이 할 사람~")
        let friend6 = FriendInformation(imageName: "maeng", name: "맹구", status: "♡")
        let friend7 = FriendInformation(imageName: "hun", name: "훈이", status: "모자이크하지마ㅠ")
        
        friendsList = [friend1, friend2, friend3, friend4, friend5, friend6, friend7]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FriendsViewController: UITableViewDataSource, UITableViewDelegate {
    
    // 내 프로필과 친구목록 섹션을 나눔
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return friendsList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:         // 내 프로필
            guard let myCell = friendsTableView.dequeueReusableCell(withIdentifier: "MyProfileCell", for: indexPath) as? MyProfileCell else { return UITableViewCell() }
            
            myCell.setMyInformation(profileImageName: "shin", name: "짱구", status: "")
            
            return myCell
            
        default:        // 친구들 프로필
            guard let friendCell = friendsTableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
            
            friendCell.setFriendInformation(
                friendImageName: friendsList[indexPath.row].imageName,
                name: friendsList[indexPath.row].name,
                status: friendsList[indexPath.row].status )
            
            return friendCell
        }
    }
    
    // 친구목록 섹션 타이틀 텍스트
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return ""
        default:
            return "친구 \(friendsList.count)"
        }
    }
    
    // 친구목록 섹션 타이틀 custom
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.white
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont.systemFont(ofSize: 11)
        header.textLabel?.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1.0)
    }
    
    // 내 프로필과 친구목록 사이의 구분선
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0 :
            return 1
        default:
            return 0.1  // 0에 가까워서 안 보임!
        }
    }
    
    // 삭제 (도전과제)
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    /*func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            friendsList.remove(at: indexPath.row)
            friendsTableView.reloadData()
        }
    }*/
    
    public func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if indexPath.section == 0 { return UISwipeActionsConfiguration() }
        
        let delete = UIContextualAction(style: .destructive, title: "삭제") { action, view, completion in
            self.friendsList.remove(at: indexPath.row)
            //tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            self.friendsTableView.reloadData()
            completion(true)
        }
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
}
