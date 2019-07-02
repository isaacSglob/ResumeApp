import UIKit

//MARK: UICollectionViewDataSource Extension
extension ProfileViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionsCount = 4
        pageController?.numberOfPages = sectionsCount
        return sectionsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.item {
        case ResumeDetailSection.about.rawValue:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.about.rawValue, for: indexPath) as? AboutDetailCell,
                let aboutLabel = cell.aboutLabel
                else {
                    return UICollectionViewCell()
            }
            aboutLabel.text = aboutSection?.aboutLabel
            
            return cell
        case ResumeDetailSection.experience.rawValue:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.experience.rawValue, for: indexPath) as? ExperienceDetailCell,
                let experienceSection = experienceSection,
                let iceCodeSummary = cell.iceCodeSummary,
                let uaqSummary = cell.uaqSummary,
                let universitySummary = cell.universitySummary else {
                    fatalError()
            }
            
            iceCodeSummary.text = experienceSection[0].formatedInfo
            uaqSummary.text = experienceSection[1].formatedInfo
            universitySummary.text = experienceSection[2].formatedInfo
            
            return cell
        case ResumeDetailSection.skills.rawValue:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.skills.rawValue, for: indexPath) as? SkillsDetailCell,
                let skillsSection = skillsSection,
                let javaSummary = cell.javaSummary,
                let gitSummary = cell.gitSummary,
                let androidSummary = cell.androidSummary,
                let swiftSummary = cell.swiftSummary else {
                    fatalError()
            }
            
            javaSummary.text = skillsSection[0].time
            gitSummary.text = skillsSection[1].time
            androidSummary.text = skillsSection[2].time
            swiftSummary.text = skillsSection[3].time
            
            return cell
        case ResumeDetailSection.information.rawValue:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.information.rawValue, for: indexPath) as? InformationDetailCell,
                let informationSection = informationSection,
                let cellPhoneLabel = cell.cellphoneLabel,
                let directionLabel = cell.directionLabel,
                let emailLabel = cell.emailLabel else {
                    fatalError()
            }
            
            cellPhoneLabel.text = informationSection.cellphoneLabel
            directionLabel.text = informationSection.directionLabel
            emailLabel.text = informationSection.emailLabel
            
            return cell
        default:
            fatalError(NSLocalizedString(LocalizedKeys.noSectionFound.rawValue, comment: ""))
        }
    }
}

