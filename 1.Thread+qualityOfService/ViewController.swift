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
        // пример того, что асинхронный код зависит от RunLoop и конкурирует с другими задачами за ресурсы в потоке
                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                    print(Date())
                }
                //в этом примере принт sleep(1),который происходил каждую секунду, и принт даты, каждые полсекунды, конфликтовали за ресурсы в главном потоке
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    print(sleep(1))
                }
                //если есть вероятность того, что ресурсов на выполнение всех задач не хватит, то надо вынести какой-то код в другой поток
    }


}

