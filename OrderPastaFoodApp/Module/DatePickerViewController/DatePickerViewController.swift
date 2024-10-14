//
//  DatePickerViewController.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 11/10/24.
//

import UIKit

protocol DatePickerViewControllerDelegate: AnyObject {
    func didSelectDateAndZodiac(date: String, zodiac: String)
}

struct Zodiac {
    let name: String
    let imageName: String
}

class DatePickerViewController: BaseViewController {
    
    weak var delegate: DatePickerViewControllerDelegate?
    
    @IBOutlet weak var containerImgView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var zodiacPicker: UIPickerView!
    @IBOutlet weak var datePickerView: UIPickerView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var days = Array(1...31)
    let months = Array(1...12)
    let years = Array(1900...2024)
    
    let zodiacSigns: [Zodiac] = [
            Zodiac(name: "Aries", imageName: "aries"),
            Zodiac(name: "Taurus", imageName: "taurus"),
            Zodiac(name: "Gemini", imageName: "gemini"),
            Zodiac(name: "Cancer", imageName: "cancer"),
            Zodiac(name: "Leo", imageName: "leo"),
            Zodiac(name: "Virgo", imageName: "virgo"),
            Zodiac(name: "Libra", imageName: "libra"),
            Zodiac(name: "Scorpio", imageName: "scorpio"),
            Zodiac(name: "Sagittarius", imageName: "sagittarius"),
            Zodiac(name: "Capricorn", imageName: "capricorn"),
            Zodiac(name: "Aquarius", imageName: "aquarius"),
            Zodiac(name: "Pisces", imageName: "pisces")
        ]
    
    var selectedDay = 13
    var selectedMonth = 6
    var selectedYear = 1997
    var selectedZodiac = "Gemini"

    override func viewDidLoad() {
        super.viewDidLoad()
        updateDateLabel()
        
        datePickerView.delegate = self
        datePickerView.dataSource = self
        
        zodiacPicker.delegate = self
        zodiacPicker.dataSource = self
        
        updateZodiacImage(for: zodiacSigns[2])
        
        imgView.layer.cornerRadius = 80
        imgView.layer.masksToBounds = true
                
               
    }
    func updateDateLabel() {
            dateLabel.text = "Selected Date: \(selectedDay)-\(selectedMonth)-\(selectedYear)"
        }
    func isLeapYear(_ year: Int) -> Bool {
            return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
        }
    func updateDaysForSelectedMonth() {
            if selectedMonth == 2 { // Februari
                if isLeapYear(selectedYear) {
                    self.days = Array(1...29) // 29 hari di tahun kabisat
                } else {
                    self.days = Array(1...28) // 28 hari di tahun non-kabisat
                }
            } else if [4, 6, 9, 11].contains(selectedMonth) {
                self.days = Array(1...30) // Bulan dengan 30 hari
            } else {
                self.days = Array(1...31) // Bulan dengan 31 hari
            }
            datePickerView.reloadComponent(0) // Muat ulang komponen hari setelah diperbarui
            
            // Periksa apakah hari yang dipilih masih valid dalam bulan yang baru
            if selectedDay > days.count {
                selectedDay = days.count
            }
        }
    func updateZodiacImage(for zodiac: Zodiac) {
            imgView.image = UIImage(named: zodiac.imageName) // Memuat gambar dari file dengan nama yang sesuai
        }
    func sendSelectedData() {
            let date = "\(selectedDay)-\(selectedMonth)-\(selectedYear)"
            let zodiac = selectedZodiac
            delegate?.didSelectDateAndZodiac(date: date, zodiac: zodiac) // Mengirim data melalui delegate
        }
}

extension DatePickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == datePickerView {
            return 3 // Komponen untuk hari, bulan, tahun
        } else if pickerView == zodiacPicker {
            return 1 // Komponen untuk zodiak
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == datePickerView {
            switch component {
            case 0: return days.count
            case 1: return months.count
            case 2: return years.count
            default: return 0
            }
        } else if pickerView == zodiacPicker {
            return zodiacSigns.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == datePickerView {
            switch component {
            case 0: return "\(days[row])" // Menampilkan hari
            case 1: return "\(months[row])" // Menampilkan bulan
            case 2: return "\(years[row])" // Menampilkan tahun
            default: return nil
            }
        } else if pickerView == zodiacPicker {
            return zodiacSigns[row].name // Menampilkan nama zodiak
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == datePickerView {
            switch component {
            case 0: selectedDay = days[row] // Memperbarui hari yang dipilih
            case 1: selectedMonth = months[row] // Memperbarui bulan yang dipilih
                updateDaysForSelectedMonth()
            case 2: selectedYear = years[row] // Memperbarui tahun yang dipilih
                updateDaysForSelectedMonth()
            default: break
            }
            updateDateLabel()
        } else if pickerView == zodiacPicker {
            let selectedZodiac = zodiacSigns[row]
            updateZodiacImage(for: selectedZodiac) // Perbarui gambar zodiak
        }
    }
}




