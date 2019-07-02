
import UIKit

final class ProfileViewController: UIViewController, Storyboarded {
    
    //MARK: - Outlets
    @IBOutlet weak var emptyStateView: UIView?
    @IBOutlet weak var retryButton: UIButton?
    @IBOutlet weak var profileStackView: UIStackView?
    @IBOutlet weak var bgProfileImage: UIView?
    @IBOutlet weak var profileImage: UIImageView?
    @IBOutlet weak var sectionCollectionView: UICollectionView?
    @IBOutlet weak var bottomContainer: UIView?
    @IBOutlet weak var profileName: UILabel?
    @IBOutlet weak var pageController: UIPageControl?
    
    // MARK: - Properties
    var presenter: ProfilePresenterInterface?
    
    var experienceSection: [ExperienceCellPresenter]? {
        didSet {
            sectionCollectionView?.reloadData()
        }
    }
    
    var aboutSection: AboutCellPresenter? {
        didSet {
            sectionCollectionView?.reloadData()
        }
    }
    
    var skillsSection: [SkillsCellPresenter]? {
        didSet {
            sectionCollectionView?.reloadData()
        }
    }
    
    var informationSection: InformationCellPresenter? {
        didSet {
            sectionCollectionView?.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionCollectionView?.dataSource = self
        sectionCollectionView?.delegate = self
        presenter?.updateView()
        pageController?.isUserInteractionEnabled = false
        sectionCollectionView?.register(UINib(nibName: CellNibName.experience.rawValue, bundle: nil),
                                        forCellWithReuseIdentifier: CellIdentifier.experience.rawValue)
        
        sectionCollectionView?.register(UINib(nibName: CellNibName.about.rawValue, bundle: nil),
                                        forCellWithReuseIdentifier: CellIdentifier.about.rawValue)
        
        sectionCollectionView?.register(UINib(nibName: CellNibName.skills.rawValue, bundle: nil),
                                        forCellWithReuseIdentifier: CellIdentifier.skills.rawValue)
        
        sectionCollectionView?.register(UINib(nibName: CellNibName.achievements.rawValue, bundle: nil),
                                        forCellWithReuseIdentifier: CellIdentifier.achievements.rawValue)
        
        sectionCollectionView?.register(UINib(nibName: CellNibName.information.rawValue, bundle: nil),
                                        forCellWithReuseIdentifier: CellIdentifier.information.rawValue)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupViewCorners()
    }
    
    //Method for setup the view corners
    func setupViewCorners() {
        bgProfileImage?.layer.cornerRadius = (bgProfileImage?.bounds.height ?? 0) / 2
        profileImage?.layer.cornerRadius = (profileImage?.frame.size.width ?? 0) / 2
    }
    
    @IBAction func retryAction(_ sender: Any) {
        presenter?.updateView()
    }
}

// MARK: - ProfileViewInterface Extension
extension ProfileViewController: ProfileViewInterface {
    
    func showProfileInfo(with profileInfo: Profile) {
        profileName?.text = profileInfo.name
        emptyStateView?.isHidden = true
        profileStackView?.isHidden = false
    }
    
    func showNetworkingError() {
        emptyStateView?.isHidden = false
        profileStackView?.isHidden = true
    }
    
    func imageFromData(data: Data) {
        profileImage?.image = UIImage(data: data)
    }
    
}

