//
//  CellEnum.swift
//  ResumeApp

enum CellNibName: String {
    case experience = "ExperienceDetailCell"
    case about = "AboutDetailCell"
    case skills = "SkillsDetailCell"
    case achievements = "AchievementsDetailCell"
    case information = "InformationDetailCell"
}

enum CellIdentifier: String {
    case experience = "ExperienceDetailCell"
    case about = "AboutDetailCell"
    case skills = "SkillsDetailCell"
    case achievements = "AchievementsDetailCell"
    case information = "InformationDetailCell"
}

enum ResumeDetailSection: Int {
    case about = 0
    case experience = 1
    case skills = 2
    case information = 3
}
