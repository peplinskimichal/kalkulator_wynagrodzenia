//
//  ContentView.swift
//  kalkulator_wynagrodzenia
//
//  Created by michal on 20/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var fullName: String = ""
    @State private var grossIncome: String = ""
    @State private var healthInsurance: String = "0"
    @State private var tax: String = "0"
    @State private var netIncome: String = "0"

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Pracownik")) {
                    TextField("Imię i nazwisko", text: $fullName)
                }

                Section(header: Text("")) {
                    TextField("dochód brutto", text: $grossIncome)
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("")) {
                    Text("składka zdrowotna: \(healthInsurance)")
                    Text("podatek: \(tax)")
                    Text("przychód netto: \(netIncome)")
                }

                Button(action: calculateTaxes) {
                    Text("Oblicz")
                }
            }
            .navigationBarTitle("Obliczenie dochodu")
        }
    }

    func calculateTaxes() {
        let grossIncomeValue = Double(grossIncome) ?? 0
        let calculatedHealthInsurance = grossIncomeValue * 0.09
        let calculatedTax = grossIncomeValue * 0.12
        let calculatedNetIncome = grossIncomeValue - calculatedHealthInsurance - calculatedTax

        healthInsurance = String(format: "%.2f", calculatedHealthInsurance)
        tax = String(format: "%.2f", calculatedTax)
        netIncome = String(format: "%.2f", calculatedNetIncome)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
