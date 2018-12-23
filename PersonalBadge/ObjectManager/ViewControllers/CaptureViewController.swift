//
//  CaptureViewController.swift
//  ObjectManager
//
//  Created by 康梁 on 2017/10/16.
//  Copyright © 2017年 LeonKang. All rights reserved.
//

import UIKit
import AVFoundation

class CaptureViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
    let session = AVCaptureSession.init()
    var input: AVCaptureDeviceInput!
    var output = AVCaptureMetadataOutput.init()
    var preview: AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        try? input = AVCaptureDeviceInput.init(device: device)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        session.sessionPreset = AVCaptureSessionPresetHigh
        if session.canAddInput(input) {
            session.addInput(input)
        }
        if session.canAddOutput(output) {
            session.addOutput(output)
        }
        
        output.metadataObjectTypes = [AVMetadataObjectTypeQRCode,
                                      AVMetadataObjectTypeUPCECode,
                                      AVMetadataObjectTypeCode39Code,
                                      AVMetadataObjectTypeCode39Mod43Code,
                                      AVMetadataObjectTypeEAN13Code,
                                      AVMetadataObjectTypeEAN8Code,
                                      AVMetadataObjectTypeCode93Code,
                                      AVMetadataObjectTypeCode128Code,
                                      AVMetadataObjectTypePDF417Code,
                                      AVMetadataObjectTypeAztecCode,
                                      AVMetadataObjectTypeInterleaved2of5Code,
                                      AVMetadataObjectTypeITF14Code,
                                      AVMetadataObjectTypeDataMatrixCode]
        
        preview = AVCaptureVideoPreviewLayer(session: session)
        preview.videoGravity = AVLayerVideoGravityResizeAspectFill
        preview.frame = view.bounds
        view.layer.insertSublayer(preview, at: 0)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        session.startRunning()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func captureOutput(_ output: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        var stringValue = String()
        if metadataObjects.count > 0 {
            session.stopRunning()
            let metadata = metadataObjects.first as! AVMetadataMachineReadableCodeObject
            stringValue = metadata.stringValue
        }
        print(stringValue)
    }

}
