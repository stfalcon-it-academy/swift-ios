//
//  FirstViewController.swift
//  ViewControllerLifecycleDemo
//
//  Created by msm72 on 6/1/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    // MARK: - 1. Инициализация контроллера из Storyboard
    // В 99% случаях мы будем создавать интерфейс с помощью сториборда (storyboard) — встроенного в XCode инструмента Interface Builder. 
    // Поэтому всем элементам storyboard нужно задавать идентификаторы, чтобы потом их можно было найти и обработать.
    // На этом этапе еще нет ни самой view, ни @IBOutlet
    
    
    // MARK: - 2. awakeFromNib
    // Вызывается для UITableViewCell и UICollectionViewCell, даже если они заданы как prototype/static cells в storyboard.
    // Вызывается для любого кастомного UIView/UIControl сабкласса, используемого в текущем контроллере.
    // Не используется для iPhone.
//    override func awakeFromNib() {
//        print("Lifecycle of FirstViewController: func awakeFromNib() start.")
//    }
    
    
    // MARK: - 3. Установка @IBOutlet свойств
    @IBOutlet weak var pannableView: UIView! {
        didSet {
            // тут можно поймать это событие в жизненном цикле
        }
    }
    

    // MARK: - 4. viewWillAppear
    // Вызывается каждый раз перед появлением view (холста) контроллера на экране
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        print("Lifecycle of FirstViewController: func viewWillAppear() start.")
    }
    

    // MARK: - 5. viewDidAppear
    // Вызывается каждый раз после появления view (холста) контроллера на экране
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        print("Lifecycle of FirstViewController: func viewDidAppear() start.")
    }
    
    
    // MARK: - 6. viewDidLoad
    // Используется, если view (холст) создан при помощи Storyboard
    // Вызывается один раз перед появлением view (холста) на экране для установки начальных настроек контроллера
    // Все, что связано с геометрией экрана инициализируется в следующих 2-х методах
    // Идеальное место для инициализации всех заданных ранее @IBOutlet
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Lifecycle of FirstViewController: func viewDidLoad() start.")
    }
    

    // MARK: - 7. viewWillLayoutSubviews
    // Вызов следующих 2-х методов обработки геометрии происходит в любое время после вызова viewDidLoad
    // Данный метод вызывается каждый раз при изменении frame (размеров) view (холста) или subviews его визуальных элементов перед их размещением на экране
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print("Lifecycle of FirstViewController: func viewWillLayoutSubviews() start.")
    }
    

    // MARK: - 8. viewDidLayoutSubviews
    // Вызывается сразу после того, как изменения frame (размеров) отображены на экране
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("Lifecycle of FirstViewController: func viewDidLayoutSubviews() start.")
    }
    

    // MARK: - 9. viewWillDisappear
    // Вызывается перед уходом view (холста) контроллера с экрана
    // В этом методе лучше всего запоминать состояние view (холста) контроллера
    // А также разместить код по очистке от ненужных значений
    // Не делайте здесь ничего, что требует значительных временных затрат - приложение будет "тормозить" 
    // Для таких задач предназначен метод viewDidDisappear()
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        
        print("Lifecycle of FirstViewController: func viewWillDisappear() start.")
    }
    

    // MARK: - 10. viewDidDisappear
    // Вызывается, когда view (холст) контроллера ушел с экрана
    // Здесь можно выполнять задачи, требующие значительных временных затрат
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        
        print("Lifecycle of FirstViewController: func viewDidDisappear() start.")
    }


    // MARK: - 11. deinit
    // Вызывается перед уничтожением контроллера
    deinit {
        print("Lifecycle of FirstViewController: func deinit() start.")
    }
    

    // MARK: - 12. didReceiveMemoryWarning
    // Вызывается, когда память устройства заполнена
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        print("Lifecycle of FirstViewController: func didReceiveMemoryWarning() start.")
    }
    
    
    // MARK: - Transition
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSecondVC" {
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: nil, action: nil)
            let destinationVC = segue.destinationViewController as! SecondViewController
            destinationVC.labelText = "Second VC"
        }
    }
    
    
    // MARK: - Rotation
    // Из этого метода можно получить новый размер view (холста) контроллера
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        print("Lifecycle of FirstViewController: func viewWillTransitionToSize() start.")
        
        // best call super just in case
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        // will execute before rotation
        
        coordinator.animateAlongsideTransition({ (UIViewControllerTransitionCoordinatorContext) in
            // will execute during rotation
            }) { (UIViewControllerTransitionCoordinatorContext) in
                // will execute after rotation
        }
    }
    
    // Из этого метода можно получить значение новой ориентации view (холста) экрана
    // Метод отменен - указано в быстрой справке к методу (Option + mouse): NS_DEPRECATED_IOS(2_0,8_0, "Implement viewWillTransitionToSize:withTransitionCoordinator: instead");
    // Его необходимо заменить на другой метод: viewWillTransitionToSize:withTransitionCoordinator: instead"), указанный выше
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        print("Lifecycle of FirstViewController: func willRotateToInterfaceOrientation() start.")
    }

}

