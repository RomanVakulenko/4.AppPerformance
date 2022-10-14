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

// вариант как перевести код в другой поток (создать экземпляр класса Thread), может управлять
        let thread2 = Thread {
            for _ in 0...100 {
                print("2nd+++++++++++++++++")
            }
        }
        thread2.qualityOfService = .background // самый минимальный приоритет, используется для фоновых задач.

        thread2.start() //нужно, чтобы запустить поток, если сразу после вызвать .cancel, то thread2 не запустится, потому нужен "промежуточный код" (или любой иной код):
//        sleep(1)
//        thread2.cancel()

// вариант как перевести код в другой поток (инкапсулировать сложную логику в отдельный класс, наследованный от класса Thread, override func main)
        let thread3 = Thread3()
        thread3.qualityOfService = .userInteractive// самый высокий приоритет когда результат нужен прямо сейчас
        thread3.start()
//        sleep(1)
//        thread3.cancel()
    }
}


class Thread3: Thread {
    override func main() {
        for _ in 0...100 {
            print("3rd_____________________")
        }
    }
}


//1. UserInteractive — самый высокий приоритет, когда результат нужен прямо сейчас.
//2. UserInitiated — пониженный приоритет, когда результат важен, но допустима небольшая задержка.
//3. Utility — почти минимальный приоритет — для ситуаций, когда результат может подождать.
//4. Background — минимальный приоритет, используется для фоновых задач.
//5. Default — приоритет по умолчанию, выбирается между userInitiated и utlility.
