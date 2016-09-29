//
//  ViewController.swift
//  GrandCentralDispatchDemo3
//
//  Created by msm72 on 6/29/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    var timeCount = NSDate()
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // 1. Create user queue: try DISPATCH_QUEUE_CONCURRENT & DISPATCH_QUEUE_SERIAL
        // 1.1. DISPATCH_QUEUE_SERIAL -> print 1, 2: user queue than main thread
        // 1.2. DISPATCH_QUEUE_CONCURRENT -> print 2, 1: main thread than user queue
        let attr = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_CONCURRENT, QOS_CLASS_USER_INITIATED, 0)
        let primeQueue = dispatch_queue_create("ru.proSwift.primer", attr)
        
        // 2. Run in user queue
        dispatch_sync(primeQueue) {
            print("1. User queue: \(self.currentQueueName()!)")
        }

        // 3. Run in main thread
        print("2. Main thread: \(currentQueueName()!)")
        
        
        // 4. ASYNC
        print("\n===  ASYNC:: Асинхронно посылаем в очередь primer ===")
       
        dispatch_async(primeQueue) {
            print(" - - - async:: Выполняем в очереди \(self.currentQueueName()!)")
        }
        
        print("=== ASYNC:: Закончили асинхронно передавать задачу в очередь primer ===")
        
        
        
        // 5. SYNC
        print("\n=== SYNC:: Синхронно посылаем в очередь primer ===")
        
        dispatch_sync(primeQueue) {
            print(" - - - sync:: Выполняем в очереди \(self.currentQueueName()!)")
        }
        
        print("=== SYNC:: Закончили синхронно передавать задачу в очередь primer ===\n")
        
        
        /*
        // SERIAL - наша primeQueue типа Serial, поэтому попробуем функционал именно этой очереди
        // Обнуление таймера
        startClock()
        print("=== Начало выполнения Serial - очереди ===")
        
        dispatch_async(dispatch_queue_create("ru.proSwift.primer.1", DISPATCH_QUEUE_SERIAL), hardJob)
        dispatch_async(dispatch_queue_create("ru.proSwift.primer.2", DISPATCH_QUEUE_SERIAL), hardJob)
        dispatch_async(dispatch_queue_create("ru.proSwift.primer.3", DISPATCH_QUEUE_SERIAL), hardJob)
        dispatch_async(dispatch_queue_create("ru.proSwift.primer.4", DISPATCH_QUEUE_SERIAL), hardJob)
        dispatch_async(dispatch_queue_create("ru.proSwift.primer.5", DISPATCH_QUEUE_SERIAL), hardJob)
        
        print("\n - = - = - = - = - = - = - = - = - = - = - = - = - = - \n")
        
        // Перерыв пять секунд между работой с разными типами очередей для удобства восприятия лога вывода в консоль.
        sleep(5)
        
        // CONCURRENT - обнуление таймера
        startClock()
        print("\n=== Начало выполнения concurrent - очереди ===")
        
        dispatch_async(dispatch_queue_create("ru.proSwift.concurrent.1", DISPATCH_QUEUE_CONCURRENT), hardJob)
        dispatch_async(dispatch_queue_create("ru.proSwift.concurrent.2", DISPATCH_QUEUE_CONCURRENT), hardJob)
        dispatch_async(dispatch_queue_create("ru.proSwift.concurrent.3", DISPATCH_QUEUE_CONCURRENT), hardJob)
        dispatch_async(dispatch_queue_create("ru.proSwift.concurrent.4", DISPATCH_QUEUE_CONCURRENT), hardJob)
        dispatch_async(dispatch_queue_create("ru.proSwift.concurrent.5", DISPATCH_QUEUE_CONCURRENT), hardJob)
        
        print("\n - = - = - = - = - = - = - = - = - = - = - = - = - = - \n")
*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Custom Functions
    func currentQueueName() -> String? {
        let label = dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL)
     
        return String(CString: label, encoding: NSUTF8StringEncoding)
    }
    
    func hardJob() {
        sleep(1)
        
        print("\(showClock()) :: \(currentQueueName()!) :: Закончили!")
    }
    
    func startClock() {
        timeCount = NSDate()
    }

    func showClock() -> String {
        return String(NSDate().timeIntervalSinceDate(timeCount))
    }
}

