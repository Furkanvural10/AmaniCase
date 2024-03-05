import UIKit
import SnapKit


final class ListPageViewController: UIViewController {
    
    // MARK: - UI Components
    private let dataTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier.rawValue)
        return tableView
    }()
    
    // MARK: - Properties
    private var viewModel = ListPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        getData()
    }
    
    private func setupUI() {
        // MARK: - TableView UI Configuration
        dataTableView.delegate = self
        dataTableView.dataSource = self
        
        view.addSubview(dataTableView)
        dataTableView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    // MARK: - Get Data Function
    private func getData() {
        viewModel.fetchUserContents { [weak self] in
            DispatchQueue.main.async {
                self?.dataTableView.reloadData()
            }
        }
    }
}

extension ListPageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.details.count
    }
}

extension ListPageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let detail = viewModel.details[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier.rawValue, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(data: detail)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = DetailPageVC()
        detailVC.detail = viewModel.details[indexPath.row]
        if let mainVC = navigationController?.viewControllers.first(where: { $0 is MainPageViewController }) as? MainPageViewController {
                    detailVC.delegate = mainVC
                }
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 120 }
}
