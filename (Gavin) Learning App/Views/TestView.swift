//
//  TestView.swift
//  (Gavin) Learning App
//
//  Created by Gavin Kwon on 3/12/23.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var selectedAnswerIndex: Int?
    @State var numCorrect = 0
    @State var submitted = false
    
    var body: some View {
        
        if model.currentQuestion != nil {
            
            VStack(alignment: .leading) {
                
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                    .padding(.leading, 20)
                
                CodeTextView()
                    .padding(.horizontal, 20)
                
                ScrollView {
                    
                    VStack {
                        
                        ForEach(0..<model.currentQuestion!.answers.count, id:\.self) { index in
                            
                            Button(action: {
                                // track the selected index
                                selectedAnswerIndex = index
                                
                            }, label: {
                                
                                ZStack {
                                    // Answer has been submitted
                                    if submitted == false {
                                        RectangleCard(color: index == selectedAnswerIndex ? .gray : .white)
                                            .frame(height: 48)
                                    } else {
                                        
                                        // User has selected the right answer - green
                                        if index == selectedAnswerIndex && index == model.currentQuestion!.correctIndex {
                                            RectangleCard(color: .green)
                                                .frame(height: 48)
                                                // user has selected the wrong answer - red
                                        } else if index == selectedAnswerIndex && index != model.currentQuestion!.correctIndex {
                                            RectangleCard(color: .red)
                                                .frame(height: 48)
                                            // This button IS the correct answer
                                        } else if index == model.currentQuestion!.correctIndex {
                                            RectangleCard(color: .green)
                                                .frame(height: 48)
                                            // the card remains White, after submitted
                                        } else {
                                            RectangleCard(color: .white)
                                                .frame(height: 48)
                                        }
                                    }

                                    
                                    Text(model.currentQuestion!.answers[index])

                                }
                                
                            })
                            .disabled(submitted)
                                                        
                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
                
                Button(action: {
                    
                    // Check if answer has been submitted
                    if submitted == true {
                        
                        model.nextQuestion()
                        
                        submitted = false
                        selectedAnswerIndex = nil
                        
                    } else {
                        
                        submitted = true
                        
                        if selectedAnswerIndex == model.currentQuestion?.correctIndex {
                            numCorrect += 1
                        }
                        
                    }
                    
                }, label: {
                
                    ZStack {
                        
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        
                        Text(buttonText)
                            .bold()
                            .foregroundColor(.white)
                            
                    }
                    .padding()
                })
                .disabled(selectedAnswerIndex == nil)
                
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
        }
        else {
            TestResultView(numCorrect: numCorrect)
        }
        
        
    }
    
    var buttonText: String {
        
        // Check if answer has been submitted
        
        if submitted == true {
            
            if model.currentQuestionIndex + 1 == model.currentModule!.test.questions.count {
                
                return "Finish"
                
            } else {
                
                return "Next" // or finish
            }
        } else {
            return "Submit"
        }
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
