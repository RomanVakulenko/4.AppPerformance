//
//  ViewController.swift
//  1.Thread+qualityOfService
//
//  Created by Roman Vakulenko on 14.10.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0...10 {
            print("sleep(1)")
        }
// 1ый вариант как перевести код в другой поток
        Thread.detachNewThread {
            for _ in 0...10 {
                print("----------")
            }
        }
// 2ой вариант как перевести код в другой поток (создать экземпляр класса Thread), может управлять
        let thread2 = Thread {
            for _ in 0...10 {
                print("+++++++++++++++++")
            }
        }
        thread2.start() //нужно, чтобы запустить поток, если сразу вызвать .cancel, то secondThread не запустится, потому нужен "промежуточный код" (или любой иной код):
        sleep(1)
        thread2.cancel()


// 3ий вариант как перевести код в другой поток (инкапсулировать сложную логику в отдельный класс, наследованный от класса Thread, override func main)
        let thread3 = Thread3()
        thread3.start()
        sleep(1)
        thread3.cancel()
    }
}

class Thread3: Thread {
    override func main() {
        for _ in 0...10 {
            print("-----Thread3-----")
        }
    }
}
