//
//  ContentView.swift
//  ichrakkkk Watch App
//
//  Created by Ichrak El Hatimi on 2023-01-21.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var isRecording = false
    @State var showDetail = false
    let recorder = Recorder()
    var body: some View {
        VStack(alignment: .leading){
            Text("Daily work meeting")
                .position(x:90 ,y: 15)
            Text("8:30am - 10:00am")
                .position(x:90 ,y: 10)
            Text("Conference room401")
                .position(x:90 ,y: 5)
            Button(action: {
                self.isRecording.toggle()
                if self.isRecording {
                    self.recorder.startRecording()
                } else {
                    self.recorder.stopRecording()
                }
            }, label: {
                Text(isRecording ? "Stop Recording" : "Start Recording")
            })
            .frame(height:30)
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: 2))
            .position(x:92 ,y: 15)
            NavigationView {
                Button(action: {
                    self.showDetail.toggle()
                }, label: {
                    Text("End")
                        .position(x:90 ,y: 5)
                })
            }.sheet(isPresented: $showDetail) {
                SwiftUIView2()
            }.buttonStyle(PlainButtonStyle())
                .frame(height:40)
                .position(x:90 ,y: 20)
        }
    }
}

class Recorder: NSObject, AVAudioRecorderDelegate {
    var audioRecorder: AVAudioRecorder!
    let fileName = "myRecording12.m4a"

    func startRecording() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileUrl = documentsDirectory.appendingPathComponent(fileName)
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            audioRecorder = try AVAudioRecorder(url: fileUrl, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()
        } catch {
            print("Recording Failed")
        }
    }

    func stopRecording() {
        audioRecorder.stop()
        audioRecorder = nil
    }

    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            print("Finished Recording Successfully")
        } else {
            print("Recording Failed")
        }
    }
    func getDirectory()-> String {
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        return dirPath
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
