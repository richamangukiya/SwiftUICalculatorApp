//
//  ContentView.swift
//  SwiftUICalculatorApp
//
//  Created by Richa Mangukiya on 11/8/24.
//

import SwiftUI
import CalculatorLogic

struct CalculatorView: View {
    @State private var display = "0"
    private let calculator = Calculator()
    @State private var currentOperation: ((Double, Double) -> Double)?
    @State private var firstValue: Double?

    var body: some View {
        VStack(spacing: 10) {
            Text(display)
                .font(.largeTitle)
                .padding()
                .frame(maxWidth: .infinity, alignment: .trailing)

            ForEach(buttonLayout, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row, id: \.self) { button in
                        Button(action: { buttonTapped(button) }) {
                            Text(button)
                                .font(.title)
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .clipShape(Circle())
                        }
                    }
                }
            }
        }
        .padding()
    }

    private let buttonLayout = [
        ["7", "8", "9", "+"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "x"],
        ["0", ".", "=", "/"],
        ["sin", "cos", "tan", "C"]
    ]

    private func buttonTapped(_ button: String) {
        switch button {
        case "0"..."9":
            if display == "0" {
                display = button
            } else {
                display += button
            }
        case ".":
            if !display.contains(".") {
                display += "."
            }
        case "+", "-", "x", "/":
            setOperation(button)
        case "=":
            calculateResult()
        case "sin":
            display = "\(calculator.sine(Double(display) ?? 0))"
        case "cos":
            display = "\(calculator.cosine(Double(display) ?? 0))"
        case "tan":
            display = "\(calculator.tangent(Double(display) ?? 0))"
        case "C":
            display = "0"
        default:
            break
        }
    }

    private func setOperation(_ operation: String) {
        firstValue = Double(display) ?? 0
        currentOperation = operationFunction(for: operation)
        display = "0"
    }

    private func calculateResult() {
        guard let firstValue = firstValue,
              let operation = currentOperation else { return }

        let secondValue = Double(display) ?? 0
        let result = operation(firstValue, secondValue)
        display = "\(result)"
        
        // Reset operation and first value
        self.firstValue = nil
        self.currentOperation = nil
    }

    private func operationFunction(for symbol: String) -> ((Double, Double) -> Double)? {
        switch symbol {
        case "+":
            return calculator.add
        case "-":
            return calculator.subtract
        case "x":
            return calculator.multiply
        case "/":
            return calculator.divide
        default:
            return nil
        }
    }
}

struct ContentView: View {
    var body: some View {
        CalculatorView()
    }
}

#Preview {
    ContentView()
}
