//
//  DateExtension.swift
//  SlidingAnimation
//
//  Created by Rajaram Tiwari on 06/10/23.
//

import Foundation

extension Date {
    
    enum DateFormat: String {
        case HHmmWithColon = "HH:mm"
        case HHmmssWithColon = "HH:mm:ss"
        case dayOnly = "dd"
        case monthOnly = "MMM"
        case monthAndYear = "MMMyy"
        case yearMonth = "yy-MM"
        case MMMddYyyyWithHyphen = "MMM-dd-yyyy"
        case yyyyMMddHHmmssWithHyphenAndDots = "yyyy-MM-dd HH.mm.ss"
        case completeDateFormatWithQuotes = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        case completeDateFormatWithoutMiliSeconds = "yyyy-MM-dd HH:mm:ss Z"
        case dateOnlyWithHyphenInyyyyMMdd = "yyyy-MM-dd"
        case ddMMMyyyy = "dd MMM yyyy"
        case dateOnlyWithHyphenInddMMMyyyy = "dd-MMM-yyyy"
        case hhmm = "HHmm"
        case MMMddyyyyHHmmWithColon = "MMM dd yyyy HH:mm"
        case MMMddyyyyHHmmWithCommaColon = "MMM dd yyyy, HH:mm"
        case completeDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        case completeDateFormatWithoutMillisecs = "yyyy-MM-dd'T'HH:mm:ssZ"
        case headerTimeStampFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z"
        case ddMMMhhmm = "dd MMM, HH:mm"
        case ddMMMhhmmWithoutComma = "dd MMM HH:mm"
        case completeDateFormatWithoutZ = "yyyy-MM-dd'T'HH:mm:ss"
        case completeDateFormatWithoutMillisecsWithZ = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        case yyMMddHHmmWithoutSpace = "yyMMddHHmm"
        case HHmmddMMMyyyDateFormat = "HH:mm, dd MMM yyyy"
        case ddMMMyyyyHHmmWithComma = "dd MMM yyyy, HH:mm"
        case ddMMMyyyyHHmmssWithComma = "dd MMM yyyy, HH:mm:ss"
        case azureDateFormat = "EEE',' dd MMM yyyy HH':'mm':'ss z"
    }
    
    static var currentDate: Date {
        return Date()
    }
    
    static func getDateInDD_MMM_YYYYFormat(date: Date?) -> String {
        return stringFromDate(date: date, format: DateFormat.ddMMMyyyy)
    }
    
    static func stringFromDate(date: Date?, format: DateFormat? = DateFormat.yyyyMMddHHmmssWithHyphenAndDots) -> String {
        return date != nil ? getDateFormatter(dateFormat: format).string(from: date!) : ""
    }
    
    static func getDateFormatter(dateFormat: DateFormat? = DateFormat.yyyyMMddHHmmssWithHyphenAndDots, timeZone: TimeZone? = TimeZone(identifier: "UTC"), locale: Locale = Locale.init(identifier: "en_GB")) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat?.rawValue
        formatter.timeZone = timeZone
        formatter.locale = locale
        return formatter
    }
    
    func getPreviousDate() -> Date? {
        return Date.getCalender("UTC").date(byAdding: .day, value: -1, to: self) ?? nil
    }
    
    func getNextDate() -> Date? {
        return Date.getCalender("UTC").date(byAdding: .day, value: 1, to: self) ?? nil
    }
    
    static func getCalender(_ timeZone: String) -> Calendar {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: timeZone) ?? TimeZone.current
        calendar.locale = Locale.current
        return calendar
    }
}
