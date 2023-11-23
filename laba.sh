#!/bin/bash


echo "Зайцев А.А., Ляхман П.С."
echo "Скрипт-навигатор по файловой системе Linux"
echo "Описание: Простой скрипт для навигации по файловой системе Linux"

navigate() {
    while true; do
    
        echo -e "\nТекущий каталог: $(pwd)"

        echo "Выберите действие:"
        echo "1. Показать текущий каталог"
        echo "2. Подняться на каталог выше"
        echo "3. Перейти в каталог"

        read -p "Введите номер действия (или 'q' для выхода): " choice

        case $choice in
            1)
                # Показать текущий каталог
                ;;
            2)
                # Подняться на каталог выше
                cd ..
                ;;
            3)
                # Перейти в каталог
                echo "Список доступных каталогов:"
                ls -l | grep "^d" | awk '{print $9}'
                read -p "Введите название каталога: " dir_name

                # Проверка наличия каталога
                if [ -d "$dir_name" ]; then
                    cd "$dir_name" || { echo "Ошибка при переходе в каталог $dir_name" >&2; exit 1; }
                else
                    echo "Каталог $dir_name не существует." >&2
                fi
                ;;
            q)
                echo "Выход из программы."
                exit 0
                ;;
            *)
                echo "Некорректный ввод. Попробуйте еще раз." >&2
                ;;
        esac
    done
}

navigate
