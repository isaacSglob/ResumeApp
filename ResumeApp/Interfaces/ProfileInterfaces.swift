//  ProfileInterfaces.swift
//  ResumeApp

import UIKit

protocol ProfileViewInterface: ViewInterface {
    var experienceSection: [ExperienceCellPresenter]? {get set}
    var skillsSection: [SkillsCellPresenter]? {get set}
    var informationSection: InformationCellPresenter? {get set}
    var aboutSection: AboutCellPresenter? {get set}
    func showProfileInfo(with profileInfo: Profile)
    func showNetworkingError()
    func imageFromData(data: Data)
}

protocol ProfilePresenterInterface: PresenterInterface {
    func updateView()
    func getImage(imageURL: String)
}

protocol ProfileInteractorInterface: InteractorInterface {
    func fetchProfileInfo(completion: @escaping (Result<Profile, ServiceConstants.NetworkingError>) -> Void)
    func fetchImage(withURL url: String, completion: @escaping (Result<Data, ServiceConstants.NetworkingError>) -> Void)
}
