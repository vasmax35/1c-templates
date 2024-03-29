
#Область ПрограммныйИнтерфейс

#Область ДобавлениеЭлементовФормы

#Область ТаблицыФормы

// Создает новую таблицу формы в случае ее отсутствия, иначе возвращается существующий на форме элемент 
// 
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма для создания элемента
//  ПараметрыДляСоздания - Структура - Параметры для создания элемента формы
// 
// Возвращаемое значение:
//  ТаблицаФормы - Созданный элемент формы
Функция СоздатьТаблицуФормы(Форма, ПараметрыДляСоздания) Экспорт
	
	Если НЕ ПроверитьПараметрыДляСозданияЭлемента(ПараметрыДляСоздания) Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	НайденныйЭлемент = НайтиЭлементФормыПоИмени(Форма, ПараметрыДляСоздания.Имя);
	Если НайденныйЭлемент <> Неопределено Тогда
		Возврат НайденныйЭлемент;
	КонецЕсли;
	
	Параметры = КонструкторПараметрыПоляФормы();
	ЗаполнитьЗначенияСвойств(Параметры, ПараметрыДляСоздания);
	
	Если Параметры.Родитель = Неопределено Тогда
		Параметры.Родитель = Форма;
	КонецЕсли;

	Возврат ФормыУХ.СоздатьТаблицуФормы(
		Форма.Элементы,
		Параметры.Имя,
		Параметры.Заголовок,
		Параметры.ПутьКДанным,
		Параметры.Родитель,
		Параметры.ВставитьПередЭлементом,
		Параметры.ДополнительныеПараметры,
		Параметры.События
	);
	
КонецФункции

// Создает новую таблицу формы в случае ее отсутствия, иначе возвращается существующий на форме элемент
// Альтернативный вариант сигнатуры См. СоздатьТаблицуФормы
// 
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма для создания элемента
//  Имя - Строка - Имя создаваемого элемента
//  ПутьКДанным - Строка - Путь к данным элемента
//  Родитель - ГруппаФормы, ФормаКлиентскогоПриложения - Родитель для размещения элемента
//  ДополнительныеПараметры - Структура - Дополнительные параметры создаваемого элемента
//  События - Структура - События элемента:
// * Ключ - Строка - Имя события
// * Значение - Строка - Имя метода действия
// 
// Возвращаемое значение:
//  ТаблицаФормы - Созданный элемент формы
Функция ДобавитьТаблицуФормы(Форма,
							 Имя,
							 ПутьКДанным,
							 Родитель = Неопределено,
							 ДополнительныеПараметры = Неопределено,
							 События = Неопределено) Экспорт

	ПараметрыЭлемента = Новый Структура;
	ПараметрыЭлемента.Вставить("Имя", Имя);
	ПараметрыЭлемента.Вставить("ПутьКДанным", ПутьКДанным);
	ПараметрыЭлемента.Вставить("Родитель", Родитель);
	ПараметрыЭлемента.Вставить("ДополнительныеПараметры", ДополнительныеПараметры);
	ПараметрыЭлемента.Вставить("События", События);

	Возврат СоздатьТаблицуФормы(Форма, ПараметрыЭлемента);

КонецФункции

#КонецОбласти

#Область ГруппыФормы

// Создает новую группу формы в случае ее отсутствия, иначе возвращается существующий на форме элемент
// 
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма для создания элемента
//  ПараметрыДляСоздания - Структура - Параметры для создания элемента формы
// 
// Возвращаемое значение:
//  ГруппаФормы - Созданный элемент формы
Функция СоздатьГруппуФормы(Форма, ПараметрыДляСоздания) Экспорт
	
	Если НЕ ПроверитьПараметрыДляСозданияЭлемента(ПараметрыДляСоздания) Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	НайденныйЭлемент = НайтиЭлементФормыПоИмени(Форма, ПараметрыДляСоздания.Имя);
	Если НайденныйЭлемент <> Неопределено Тогда
		Возврат НайденныйЭлемент;
	КонецЕсли;
	
	Параметры = КонструкторПараметрыГруппаФормы();
	ЗаполнитьЗначенияСвойств(Параметры, ПараметрыДляСоздания);

	Если Параметры.Родитель = Неопределено Тогда
		Параметры.Родитель = Форма;
	КонецЕсли;
	
	Возврат ФормыУХ.СоздатьГруппуФормы(
		Форма.Элементы,
		Параметры.Имя,
		Параметры.Заголовок,
		Параметры.Вид,
		Параметры.Родитель,
		Параметры.ВставитьПередЭлементом,
		Параметры.ДополнительныеПараметры,
		Параметры.События
		);
	
КонецФункции

// Создает новую группу формы в случае ее отсутствия, иначе возвращается существующий на форме элемент
// Альтернативный вариант сигнатуры См. СоздатьГруппуФормы
// 
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма для создания элемента
//  Имя - Строка - Имя создаваемого элемента
//  Родитель - ГруппаФормы, ФормаКлиентскогоПриложения - Родитель для размещения элемента
//  Группировка - ГруппировкаПодчиненныхЭлементовФормы - Вариант группировки подчиненных документов
//  Отображение - ОтображениеОбычнойГруппы - Отображение группы на форме
//  ОтображатьЗаголовок - Булево - Отображать или нет заголовок
//  Заголовок - Строка - Заголовок группы
// 
// Возвращаемое значение:
//  ГруппаФормы - Созданный элемент формы
Функция ДобавитьГруппуФормы(Форма,
							Имя,
							Родитель = Неопределено,
							Группировка = Неопределено,
							Отображение = Неопределено,
							ОтображатьЗаголовок = Ложь,
							Заголовок = "") Экспорт

	ПараметрыЭлемента = Новый Структура;
	ПараметрыЭлемента.Вставить("Родитель", Родитель);
	ПараметрыЭлемента.Вставить("Имя", Имя);
	ПараметрыЭлемента.Вставить("Группировка", Группировка);
	ПараметрыЭлемента.Вставить("Отображение", Отображение);
	ПараметрыЭлемента.Вставить("ОтображатьЗаголовок", ОтображатьЗаголовок);
	ПараметрыЭлемента.Вставить("Заголовок", Заголовок);
	
	Возврат СоздатьГруппуФормы(Форма, ПараметрыЭлемента);
		
КонецФункции

// Создает страницу формы
// 
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма для создания элемента
//  Имя - Строка - Имя страницы
//  Заголовок - Строка - Заголовок страницы
//  Родитель - Строка, ГруппаФормы - Родитель страницы или его имя
//	
// Возвращаемое значение:
//  ГруппаФормы - Созданная страница
Функция ДобавитьСтраницуФормы(Форма, Имя, Заголовок, Родитель) Экспорт
	
	ПараметрыСоздания = КонструкторПараметрыГруппаФормы(Имя, Заголовок);
	
	Если ТипЗнч(Родитель) = Тип("Строка") Тогда
		ПараметрыСоздания.Родитель = НайтиЭлементФормыПоИмени(Форма, Родитель);
	Иначе
		ПараметрыСоздания.Родитель = Родитель;
	КонецЕсли;
	
	ПараметрыСоздания.Вид = ВидГруппыФормы.Страница;
	ПараметрыСоздания.ДополнительныеПараметры.Вставить("ВертикальнаяПрокруткаПриСжатии", Истина);
	
	Возврат СоздатьГруппуФормы(Форма, ПараметрыСоздания);
	
КонецФункции

// Добавляет группу страниц формы
// 
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма для создания элемента
//  Имя - Строка - Имя создаваемого элемента
//  Родитель - Строка, ГруппаФормы, ФормаКлиентскогоПриложения - Родитель для размещения элемента или его имя
//  События - Массив, Неопределено - События группы
//  
// Возвращаемое значение:
//  ГруппаФормы - Созданная группа
Функция ДобавитьСтраницыФормы(Форма, Имя, Родитель = Неопределено, События = Неопределено) Экспорт
	
	ПараметрыСоздания = КонструкторПараметрыГруппаФормы(Имя);
	Если ТипЗнч(Родитель) = Тип("Строка") Тогда
		ПараметрыСоздания.Родитель = НайтиЭлементФормыПоИмени(Форма, Родитель);
	Иначе
		ПараметрыСоздания.Родитель = Родитель;
	КонецЕсли;
	
	ПараметрыСоздания.Вид = ВидГруппыФормы.Страницы;
	ПараметрыСоздания.События = События;
	
	Возврат СоздатьГруппуФормы(Форма, ПараметрыСоздания);
	
КонецФункции

#КонецОбласти

#Область ПоляФормы

// Создает новый элемент формы в случае его отсутствия, иначе возвращается существующий на форме элемент
// 
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма для создания элемента
//  ПараметрыДляСоздания - Структура - Параметры для создания элемента формы
// 
// Возвращаемое значение:
//  ЭлементФормы - Созданный элемент формы
Функция СоздатьПолеФормы(Форма, ПараметрыДляСоздания) Экспорт
	
	Если НЕ ПроверитьПараметрыДляСозданияЭлемента(ПараметрыДляСоздания) Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	НайденныйЭлемент = НайтиЭлементФормыПоИмени(Форма, ПараметрыДляСоздания.Имя);
	Если НайденныйЭлемент <> Неопределено Тогда
		Возврат НайденныйЭлемент;
	КонецЕсли;
	
	Параметры = КонструкторПараметрыПоляФормы();
	ЗаполнитьЗначенияСвойств(Параметры, ПараметрыДляСоздания);
	
	Если Параметры.Родитель = Неопределено Тогда
		Параметры.Родитель = Форма;
	КонецЕсли;
	
	Если ЗначениеЗаполнено(Параметры.Подсказка) Тогда
		Если ТипЗнч(Параметры.ДополнительныеПараметры) <> Тип("Структура") Тогда
			Параметры.ДополнительныеПараметры = Новый Структура;
		КонецЕсли;

		Параметры.ДополнительныеПараметры.Вставить("Подсказка", Параметры.Подсказка);
	КонецЕсли;
	
	Возврат ФормыУХ.СоздатьПолеФормы(
		Форма.Элементы,
		Параметры.Имя,
		Параметры.Заголовок,
		Параметры.ПутьКДанным,
		Параметры.Вид,
		Параметры.Родитель,
		Параметры.ВставитьПередЭлементом,
		Параметры.ДополнительныеПараметры,
		Параметры.События);
	
КонецФункции

// Создает новый элемент формы в случае его отсутствия, иначе возвращается существующий на форме элемент
// Альтернативный вариант сигнатуры См. СоздатьПолеФормы
// 
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма для создания элемента
//  Имя - Строка - Имя создаваемого элемента
//  ПутьКДанным - Строка - Путь к данным элемента
//  Вид - ВидПоляФормы - Вид создаваемого поля формы
//  Родитель - ГруппаФормы, ФормаКлиентскогоПриложения - Родитель для размещения элемента
//  ДополнительныеПараметры - Структура - Дополнительные параметры создаваемого элемента
//  СвязиПараметровВыбора - Массив - Связи параметров выбора поля
//  События - Структура - События элемента:
// * Ключ - Строка - Имя события
// * Значение - Строка - Имя метода действия
// 
// Возвращаемое значение:
//  ПолеФормы - Созданный элемент формы
Функция ДобавитьПолеФормы(Форма,
						  Имя,
						  ПутьКДанным,
						  Вид,
						  Родитель = Неопределено,
						  ДополнительныеПараметры = Неопределено,
						  СвязиПараметровВыбора = Неопределено,
						  События = Неопределено) Экспорт
	
	Если ДополнительныеПараметры = Неопределено Тогда
		ДополнительныеПараметры = Новый Структура();
	КонецЕсли;
	
	Если НЕ СвязиПараметровВыбора = Неопределено Тогда
		ДополнительныеПараметры.Вставить("СвязиПараметровВыбора", Новый ФиксированныйМассив(СвязиПараметровВыбора));
	КонецЕсли;
	
	ПараметрыЭлемента = Новый Структура();
	ПараметрыЭлемента.Вставить("Вид", Вид);
	ПараметрыЭлемента.Вставить("Имя", Имя);
	ПараметрыЭлемента.Вставить("ПутьКДанным", ПутьКДанным);
	ПараметрыЭлемента.Вставить("Родитель", Родитель);
	ПараметрыЭлемента.Вставить("ДополнительныеПараметры", ДополнительныеПараметры);
	ПараметрыЭлемента.Вставить("События", События);

	Возврат СоздатьПолеФормы(Форма, ПараметрыЭлемента);
	
КонецФункции

// Добавляет на форму простое поле ввода без действий, без оформления.
// 
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма для создания элемента
//  Имя - Строка - Имя создаваемого элемента
//  ПутьКДанным - Строка - Путь к данным элемента
//  Родитель - ГруппаФормы, ФормаКлиентскогоПриложения - Родитель для размещения элемента
// 
// Возвращаемое значение:
//  ПолеФормы - Созданный элемент формы
Функция ДобавитьПростоеПолеВвода(Форма, Имя, ПутьКДанным, Родитель = Неопределено) Экспорт
	
	ПараметрыЭлемента = КонструкторПараметрыПоляФормы(Имя, ПутьКДанным, Родитель);
	ПараметрыЭлемента.Вид = ВидПоляФормы.ПолеВвода;

	Возврат СоздатьПолеФормы(Форма, ПараметрыЭлемента);
	
КонецФункции

// Добавляет на форму простое поле флажка без действий, без оформления.
// 
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма для создания элемента
//  Имя - Строка - Имя создаваемого элемента
//  ПутьКДанным - Строка - Путь к данным элемента
//  Родитель - ГруппаФормы, ФормаКлиентскогоПриложения - Родитель для размещения элемента
// 
// Возвращаемое значение:
//  ПолеФормы - Созданный элемент формы
Функция ДобавитьПростоеПолеФлажка(Форма, Имя, ПутьКДанным, Родитель = Неопределено) Экспорт
	
	ПараметрыЭлемента = КонструкторПараметрыПоляФормы(Имя, ПутьКДанным, Родитель);
	ПараметрыЭлемента.Вид = ВидПоляФормы.ПолеФлажка;
	ПараметрыЭлемента.ДополнительныеПараметры.Вставить("ПоложениеЗаголовка", ПоложениеЗаголовкаЭлементаФормы.Право);

	Возврат СоздатьПолеФормы(Форма, ПараметрыЭлемента);
	
КонецФункции
	
#КонецОбласти

#Область КнопкиИКомандыФормы

// Создает новую кнопку формы в случае ее отсутствия, иначе возвращается существующий на форме элемент
//
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма для создания кнопки
//  ПараметрыДляСоздания - Структура - Параметры для создания кнопки формы
// 
// Возвращаемое значение:
//  КнопкаФормы - Созданный элемент формы
Функция СоздатьКнопкуФормы(Форма, ПараметрыДляСоздания) Экспорт
	
	Если НЕ ПроверитьПараметрыДляСозданияЭлемента(ПараметрыДляСоздания) Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	НайденныйЭлемент = НайтиЭлементФормыПоИмени(Форма, ПараметрыДляСоздания.Имя);
	Если НайденныйЭлемент <> Неопределено Тогда
		Возврат НайденныйЭлемент;
	КонецЕсли;
	
	Параметры = КонструкторПараметрыКнопкаФормы();
	ЗаполнитьЗначенияСвойств(Параметры, ПараметрыДляСоздания);
	
	Если Параметры.Родитель = Неопределено Тогда
		Параметры.Родитель = Форма;
	КонецЕсли;
	
	Возврат ФормыУХ.СоздатьКнопкуФормы(
		Форма.Элементы,
		Параметры.Имя,
		Параметры.Заголовок,
		Параметры.ИмяКоманды,
		Параметры.Вид,
		Параметры.Родитель,
		Параметры.ВставитьПередЭлементом,
		Параметры.ДополнительныеПараметры,
		Параметры.События
	);
	
КонецФункции

// Создает новую кнопку формы с одновремнным создаением одноименной команды для нее
// 
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма для создания элемента
//  Имя - Строка - Имя добавляемой кнопки
//  Родитель - ЭлементФормы - Родитель размещения кнопки
//  Картинка - Картинка - Картинка действия кнопки
//  Отображение - ОтображениеКнопки - Отображение текста и картинки кнопки
//  Заголовок - Строка - Заголовок 
//  Вид - ВидКнопкиФормы - Вид создаваемой кнопки
//  ДополнительныеПараметры - Структура - Дополнительные параметры создаваемого элемента
// 
// Возвращаемое значение:
//  КнопкаФормы - Созданный элемент формы
Функция ДобавитьКнопкуФормы(Форма,
							Имя,
							Родитель = Неопределено,
							Картинка = Неопределено,
							Отображение = Неопределено,
							Заголовок = "",
							Вид = Неопределено,
							ДополнительныеПараметры = Неопределено) Экспорт

	ПараметрыЭлемента = Новый Структура;
	ПараметрыЭлемента.Вставить("Имя", Имя);
	ПараметрыЭлемента.Вставить("Действие", Имя);
	ПараметрыЭлемента.Вставить("Картинка", Картинка);
	ПараметрыЭлемента.Вставить("Отображение", Отображение);
	Команда = СоздатьКоманду(Форма, ПараметрыЭлемента);
	
	Если Команда = Неопределено Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	ПараметрыЭлемента = Новый Структура;
	ПараметрыЭлемента.Вставить("Родитель", Родитель);
	ПараметрыЭлемента.Вставить("Имя", Имя);
	ПараметрыЭлемента.Вставить("ИмяКоманды", Имя);
	ПараметрыЭлемента.Вставить("Заголовок", Заголовок);
	ПараметрыЭлемента.Вставить("Вид", Вид);
	ПараметрыЭлемента.Вставить("ДополнительныеПараметры", ДополнительныеПараметры);
	
	Возврат СоздатьКнопкуФормы(Форма, ПараметрыЭлемента);
		
КонецФункции

// Создает новую команду формы в случае ее отсутствия либо возвращает существующий элемент
//	
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма для создания команды
//  ПараметрыДляСоздания - Структура - Параметры для создания команды формы
// 
// Возвращаемое значение:
//  КомандаФормы - Команда формы
Функция СоздатьКоманду(Форма, ПараметрыДляСоздания) Экспорт
	
	Если НЕ ПроверитьПараметрыДляСозданияЭлемента(ПараметрыДляСоздания) Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	Параметры = КонструкторПараметрыКомандаФормы();
	ЗаполнитьЗначенияСвойств(Параметры, ПараметрыДляСоздания);
	Возврат ФормыУХ.СоздатьКоманду(Форма,
				Параметры.Имя,
				Параметры.Заголовок,
				Параметры.Действие,
				Параметры.Картинка,
				Параметры.Отображение);
	
КонецФункции

// Создает новую команду формы в случае ее отсутствия, иначе возвращается существующий на форме элемент
// Альтернативный вариант сигнатуры См. СоздатьКоманду
// 
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма для создания команды
//  Имя - Строка - Имя создаваемой команды
//  Заголовок - Строка - Заголовок создаваемой команды
//  Действие - Строка - Имя действия команды
//  Картинка - Картинка - Картинка, отображающаяся на кнопках, привязанных к команде
//  Отображение - ОтображениеКнопки - Указывает вид отображения связанной кнопки
// 
// Возвращаемое значение:
//  КомандаФормы - Созданная команда
Функция ДобавитьКоманду(Форма,
						Имя,
						Заголовок,
						Действие,
						Картинка = Неопределено,
						Отображение = Неопределено) Экспорт

	Параметры = КонструкторПараметрыКомандаФормы(Имя, Действие, Заголовок);
	Параметры.Картинка = Картинка;
	Параметры.Отображение = Отображение;
	
	Возврат СоздатьКоманду(Форма, Параметры);
		
КонецФункции

#КонецОбласти

#Область ДекорацииФормы

// Создает новую декорацию формы в случае ее отсутствия, иначе возвращается существующий на форме элемент 
// 
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма для создания элемента
//  ПараметрыДляСоздания - Структура - Параметры для создания элемента формы
// 
// Возвращаемое значение:
//  ДекорацияФормы - Созданный элемент формы
Функция СоздатьДекорациюФормы(Форма, ПараметрыДляСоздания) Экспорт
	
	Если НЕ ПроверитьПараметрыДляСозданияЭлемента(ПараметрыДляСоздания) Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	НайденныйЭлемент = НайтиЭлементФормыПоИмени(Форма, ПараметрыДляСоздания.Имя);
	Если НайденныйЭлемент <> Неопределено Тогда
		Возврат НайденныйЭлемент;
	КонецЕсли;
	
	Параметры = КонструкторПараметрыДекорацииФормы();
	ЗаполнитьЗначенияСвойств(Параметры, ПараметрыДляСоздания);
	
	Если Параметры.Родитель = Неопределено Тогда
		Параметры.Родитель = Форма;
	КонецЕсли;

	Возврат ФормыУХ.СоздатьДекорациюФормы(
		Форма.Элементы,
		Параметры.Имя,
		Параметры.Заголовок,
		Параметры.Вид,
		Параметры.Родитель,
		Параметры.ВставитьПередЭлементом,
		Параметры.ДополнительныеПараметры,
		Параметры.События
	);
	
КонецФункции

// Создает новую декорацию формы в случае ее отсутствия, иначе возвращается существующий на форме элемент
// Альтернативный вариант сигнатуры См. СоздатьДекорациюФормы
// 
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма для создания элемента
//  Имя - Строка - Имя создаваемого элемента
//  Заголовок - Строка - Заголовок создаваемого элемента
//  Вид - ВидДекорацииФормы - Вид создаваемой декорации
//  Родитель - ГруппаФормы, ФормаКлиентскогоПриложения - Родитель для размещения элемента
// 	ВставитьПередЭлементом - ЭлементФормы - Элемент формы, перед которым разместить новый элемент
//  ДополнительныеПараметры - Структура - Параметры для создания декорации
// 
// Возвращаемое значение:
//  ДекорацияФормы - Созданный элемент формы
Функция ДобавитьДекорациюФормы(Форма,
							Имя,
							Заголовок = "",
							Вид = Неопределено,
							Родитель = Неопределено,
							ВставитьПередЭлементом = Неопределено,
							ДополнительныеПараметры = Неопределено) Экспорт

	ПараметрыЭлемента = КонструкторПараметрыДекорацииФормы(Имя, Родитель);
	ПараметрыЭлемента.Заголовок = Заголовок;
	ПараметрыЭлемента.Вид = Вид;
	ПараметрыЭлемента.ВставитьПередЭлементом = ВставитьПередЭлементом;
	ПараметрыЭлемента.ДополнительныеПараметры = ДополнительныеПараметры;
	
	Возврат СоздатьДекорациюФормы(Форма, ПараметрыЭлемента);
		
КонецФункции

#КонецОбласти

#Область РеквизитыФормы

// Проверяет существование реквизита формы, и если он отсутствует, создает
//  и добавляет его в массив ДобавляемыеРеквизиты.
//
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма для создания элемента
//  ДобавляемыеРеквизиты - Массив - массив реквизитов формы, в который будет добавлен реквизит.
//  ПараметрыРеквизита - Структура - Параметры для создания реквизита
//
Процедура СоздатьРеквизитФормы(Форма, ДобавляемыеРеквизиты, ПараметрыРеквизита) Экспорт
	
	Если НЕ ПроверитьПараметрыДляСозданияЭлемента(ПараметрыРеквизита) Тогда
		Возврат;
	КонецЕсли;

	Параметры = КонструкторПараметрыРеквизитФормы();
	ЗаполнитьЗначенияСвойств(Параметры, ПараметрыРеквизита);

	ФормыУХ.СоздатьДобавитьРеквизитФормы(
		Форма,
		ДобавляемыеРеквизиты,
		Параметры.Имя,
		Параметры.ТипРеквизита,
		Параметры.Путь,
		Параметры.Заголовок,
		Параметры.СохраняемыеДанные
	);
	
КонецПроцедуры

// Проверяет существование реквизита формы, и если он отсутствует, создает
//  и добавляет его в массив ДобавляемыеРеквизиты.
// Альтернативная сигнатура см. СоздатьРеквизитФормы
// 
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма для создания элемента
//  ДобавляемыеРеквизиты - Массив - массив реквизитов формы, в который будет добавлен реквизит.
//  ИмяРеквизита - Строка - Имя добавляемого реквизита
//  ТипРеквизита - Строка - Имя типа создаваемого реквизита
//  Путь - Строка - Путь к данным
//  Заголовок - Строка - Заголовок реквизита
//  СохраняемыеДанные - Булево - Признак Сохраняемые данные
Процедура ДобавитьРеквизитФормы(Форма,
								ДобавляемыеРеквизиты,
								ИмяРеквизита,
								ТипРеквизита = Неопределено,
								Путь = "",
								Заголовок = "",
								СохраняемыеДанные = Ложь) Экспорт
	
	ПараметрыРеквизита = Новый Структура;
	ПараметрыРеквизита.Вставить("Имя", ИмяРеквизита);
	ПараметрыРеквизита.Вставить("ТипРеквизита", ТипРеквизита);
	ПараметрыРеквизита.Вставить("Путь", Путь);
	ПараметрыРеквизита.Вставить("Заголовок", Заголовок);
	ПараметрыРеквизита.Вставить("СохраняемыеДанные", СохраняемыеДанные);
	СоздатьРеквизитФормы(Форма, ДобавляемыеРеквизиты, ПараметрыРеквизита);
	
КонецПроцедуры

#КонецОбласти

#Область ПараметрыЭлементов

// Возвращает структуру с параметрами элементов по умолчанию для поля ввода шириной 28
// 
// Возвращаемое значение:
//  Структура
Функция ПараметрыПоляВводаПоУмолчанию() Экспорт
	Возврат ФормыУХ.ПараметрыПоляВводаПоУмолчанию();
КонецФункции

// Возвращает структуру с параметрами элементов по умолчанию для невидимого поля ввода
// 
// Возвращаемое значение:
//  Структура
Функция ПараметрыПоляВводаНевидимогоПоУмолчанию() Экспорт
	Возврат ФормыУХ.ПолучитьПараметрыЭлементовПоУмолчанию().ПолеВводаНевидимое;
КонецФункции
	
// Возвращает структуру с параметрами элементов по умолчанию для флажка
// 
// Возвращаемое значение:
//  Структура
Функция ПараметрыФлажкаПоУмолчанию() Экспорт
	Возврат ФормыУХ.ПараметрыПоляФлажкаПоУмолчанию();
КонецФункции

// Возвращает структуру с параметрами элементов по умолчанию для вертикальной группы
// 
// Возвращаемое значение:
//  Структура
Функция ПараметрыВертикальнойГруппыПоУмолчанию() Экспорт
	Возврат ФормыУХ.ПолучитьПараметрыЭлементовПоУмолчанию().ГруппаВ;
КонецФункции

// Возвращает структуру с параметрами элементов по умолчанию для горизонтальной группы
// 
// Возвращаемое значение:
//  Структура
Функция ПараметрыГоризонтальнойГруппыПоУмолчанию() Экспорт
	Возврат ФормыУХ.ПолучитьПараметрыЭлементовПоУмолчанию().ГруппаГ;
КонецФункции

#КонецОбласти

// Находит элемент формы по имени в коллекции элементов формы
// Параметры:
//  ФормаИлиКоллекцияЭлементов - ФормаКлиентскогоПриложения, ВсеЭлементыФормы - Форма или коллекция элементов формы, где происходит поиск
//  ИмяЭлемента - Строка - Имя искомого элемента
// 
// Возвращаемое значение:
//  - ДекорацияФормы, ГруппаФормы, КнопкаФормы, ТаблицаФормы, ПолеФормы - Найденный элемент формы
//	- Неопределено - Если элемент не найден  
Функция НайтиЭлементФормыПоИмени(ФормаИлиКоллекцияЭлементов, ИмяЭлемента) Экспорт
	
	ТипФормаИлиКоллекцияЭлементов = ТипЗнч(ФормаИлиКоллекцияЭлементов);
	Если ТипФормаИлиКоллекцияЭлементов = Тип("ФормаКлиентскогоПриложения") Тогда
		НайденныйЭлемент = ФормаИлиКоллекцияЭлементов.Элементы.Найти(ИмяЭлемента);
	ИначеЕсли ТипФормаИлиКоллекцияЭлементов = Тип("ВсеЭлементыФормы") Тогда
		НайденныйЭлемент = ФормаИлиКоллекцияЭлементов.Найти(ИмяЭлемента);
	Иначе
		ВызватьИсключение СтрШаблон(НСтр("ru='Передан некорректный тип данных: %1'"), ТипФормаИлиКоллекцияЭлементов);
	КонецЕсли;
	
	Возврат НайденныйЭлемент;
КонецФункции

#КонецОбласти

#Область ЧастоДобавляемыеЭлементы

// Добавляет элемент "МОЛ" на форму.
// 
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма для создания элемента
// 	Родитель - ГруппаФормы - Родитель нового элемента
// 	ВставитьПередЭлементом - ЭлементФормы - Элемент формы, перед которым разместить новый элемент
// 	ДополнительныеПараметры - Структура - Дополнительные параметры инициализации элемента
// 
// Возвращаемое значение:
//  ПолеФормы - Созданный элемент формы
Функция ДобавитьЭлемент_МОЛ(Форма,
							Родитель = Неопределено,
							ВставитьПередЭлементом = Неопределено,
							ДополнительныеПараметры = Неопределено) Экспорт

	ПараметрыЭлемента = КонструкторПараметрыПоляФормы("МОЛ", "Объект.МОЛ", Родитель);
	ПараметрыЭлемента.ВставитьПередЭлементом = ВставитьПередЭлементом;
	ПараметрыЭлемента.ДополнительныеПараметры = ДополнительныеПараметры;
	
	Возврат СоздатьПолеФормы(Форма, ПараметрыЭлемента);
	
КонецФункции

// Добавляет элемент "Центр ответственности" на форму.
// 
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма для создания элемента
// 	Родитель - ГруппаФормы - Родитель нового элемента
// 	ВставитьПередЭлементом - ЭлементФормы - Элемент формы, перед которым разместить новый элемент
// 	ДополнительныеПараметры - Структура - Дополнительные параметры инициализации элемента
// 
// Возвращаемое значение:
//  ПолеФормы - Созданный элемент формы
Функция ДобавитьЭлемент_ЦентрОтветственности(Форма, Родитель = Неопределено,
	ВставитьПередЭлементом = Неопределено, ДополнительныеПараметры = Неопределено) Экспорт

	ПараметрыЭлемента = КонструкторПараметрыПоляФормы("ЦентрОтветственности", "Объект.ЦентрОтветственности", Родитель);
	ПараметрыЭлемента.ВставитьПередЭлементом = ВставитьПередЭлементом;
	ПараметрыЭлемента.ДополнительныеПараметры = ДополнительныеПараметры;
	
	Возврат СоздатьПолеФормы(Форма, ПараметрыЭлемента);
	
КонецФункции

// Добавляет переопределяемую кнопку на форму.
// 
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма для создания элемента
//  ИмяКоманды - Строка - Имя команды
//  Заголовок - Строка - Заголовок
// 	Родитель - ГруппаФормы - Родитель нового элемента
Процедура ДобавитьПереопределяемуюКнопкуНаФорму(Форма, ИмяКоманды, Заголовок, Родитель) Экспорт

	ПараметрыКоманды = КонструкторПараметрыКомандаФормы(ИмяКоманды, "Подключаемый_ВыполнитьПереопределяемуюКоманду", Заголовок);
	Команда = СоздатьКоманду(Форма, ПараметрыКоманды);
	Если Команда = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	ПараметрыКнопки = КонструкторПараметрыКнопкаФормы(ИмяКоманды, ИмяКоманды, Родитель);
	СоздатьКнопкуФормы(Форма, ПараметрыКнопки);
	
КонецПроцедуры

#КонецОбласти

#Область КонструкторыПараметровНовыхЭлементов

// Формирует параметры для создания группы формы.
// 
// Параметры:
//  Имя - Строка - Имя создаваемой группы
//  Заголовок - Строка - Заголовок
//  Родитель - ГруппаФормы, ФормаКлиентскогоПриложения - Родитель нового элемента
// 
// Возвращаемое значение:
//  Структура - Параметры для создания группы формы:
// * Имя - Строка - Имя
// * Родитель - ГруппаФормы, ФормаКлиентскогоПриложения - Родитель нового элемента
// * Вид - ВидГруппыФормы - Вид группы формы
// * Заголовок - Строка - Заголовок
// * ВставитьПередЭлементом - ЭлементФормы - Элемент формы, перед которым разместить новый элемент
// * ДополнительныеПараметры - Структура - ДополнительныеПараметры
// * События - Массив - Массив событий
Функция КонструкторПараметрыГруппаФормы(Имя = "", Заголовок = "", Родитель = Неопределено) Экспорт
	
	Параметры = Новый Структура;
	
	// Обязательные параметры к заполнению
	Параметры.Вставить("Имя", Имя);
	
	// Не обязательные параметры к заполнению
	Параметры.Вставить("Родитель", Родитель);
	Параметры.Вставить("Вид", ВидГруппыФормы.ОбычнаяГруппа);
	Параметры.Вставить("Заголовок", Заголовок);
	Параметры.Вставить("ВставитьПередЭлементом", Неопределено);
	Параметры.Вставить("ДополнительныеПараметры", Новый Структура);
	Параметры.Вставить("События", Неопределено);
	
	Возврат Параметры;
	
КонецФункции

// Формирует параметры для создания поля формы.
// 
// Параметры:
//  Имя - Строка - Имя создаваемого элемента
//  ПутьКДанным - Строка - Путь к данным
//  Родитель - ГруппаФормы, ФормаКлиентскогоПриложения - Родитель нового элемента
// 
// Возвращаемое значение:
//  Структура - Конструктор параметры поля формы:
// * Имя - Строка - Имя
// * ПутьКДанным - Строка - Путь к данным
// * Родитель - ГруппаФормы - Родитель нового элемента
// * Вид - ВидПоляФормы - Вид группы формы
// * Заголовок - Строка - Заголовок
// * ВставитьПередЭлементом - ЭлементФормы - Элемент формы, перед которым разместить новый элемент
// * ДополнительныеПараметры - Структура - ДополнительныеПараметры
// * События - Структура - События элемента:
// ** Ключ - Строка - Имя события
// ** Значение - Строка - Имя метода действия
// * Подсказка - Строка - Подсказка
Функция КонструкторПараметрыПоляФормы(Имя = "", ПутьКДанным = "", Родитель = Неопределено) Экспорт
	
	Параметры = Новый Структура;
	
	// Обязательные параметры к заполнению
	Параметры.Вставить("Имя", 						Имя);
	Параметры.Вставить("ПутьКДанным", 				ПутьКДанным);
	
	// Не обязательные параметры к заполнению
	Параметры.Вставить("Родитель", 					Родитель);
	Параметры.Вставить("Вид", 						ВидПоляФормы.ПолеВвода);
	Параметры.Вставить("Заголовок", 				"");
	Параметры.Вставить("ВставитьПередЭлементом", 	Неопределено);
	Параметры.Вставить("ДополнительныеПараметры", 	Новый Структура);
	Параметры.Вставить("События", 					Новый Структура);
	Параметры.Вставить("Подсказка", 				"");
	
	Возврат Параметры;
	
КонецФункции

// Формирует параметры для создания команды формы.
// 
// Параметры:
//  Имя - Строка - Имя создаваемого элемента
//  Действие - Строка - Имя действия
//  Заголовок - Строка - Заголовок команды
// 
// Возвращаемое значение:
//  Структура - Конструктор параметры команды формы:
// * Имя - Строка - Имя
// * Действие - Строка - Действие
// * Заголовок - Строка - Заголовок
// * Картинка - ОбщаяКартинка - Картинка
// * Отображение - ОтображениеКнопки - Вариант отображения кнопки
Функция КонструкторПараметрыКомандаФормы(Имя = "", Действие = "", Заголовок = "") Экспорт
	
	Параметры = Новый Структура;
	
	// Обязательные параметры к заполнению
	Параметры.Вставить("Имя", Имя);
	Параметры.Вставить("Действие", Действие);
	
	// Не обязательные параметры к заполнению
	Параметры.Вставить("Заголовок", Заголовок);
	Параметры.Вставить("Картинка", Неопределено);
	Параметры.Вставить("Отображение", Неопределено);
	
	Возврат Параметры;
	
КонецФункции

// Формирует параметры для создания кнопки формы.
// 
// Параметры:
//  Имя - Строка - Имя создаваемого элемента
//  ИмяКоманды - Строка - Имя команды
//  Родитель - ГруппаФормы, ФормаКлиентскогоПриложения - Родитель нового элемента
// 
// Возвращаемое значение:
//  Структура - Конструктор параметры команды формы:
// * Имя - Строка - Имя
// * ИмяКоманды - Строка - Имя команды
// * Родитель - ГруппаФормы - Родитель нового элемента
// * Вид - ВидКнопкиФормы - Вид кнопки
// * Заголовок - Строка - Заголовок
// * ВставитьПередЭлементом - ЭлементФормы - Элемент формы, перед которым разместить новый элемент
// * ДополнительныеПараметры - Структура - ДополнительныеПараметр
Функция КонструкторПараметрыКнопкаФормы(Имя = "", ИмяКоманды = "", Родитель = Неопределено) Экспорт
	
	Параметры = Новый Структура;
	
	// Обязательные параметры к заполнению
	Параметры.Вставить("Имя", Имя);
	Параметры.Вставить("ИмяКоманды", ИмяКоманды);
	
	// Не обязательные параметры к заполнению  
	Параметры.Вставить("Родитель", Родитель);
	Параметры.Вставить("Вид", ВидКнопкиФормы.КнопкаКоманднойПанели);
	Параметры.Вставить("Заголовок", "");
	Параметры.Вставить("ВставитьПередЭлементом", Неопределено);
	Параметры.Вставить("ДополнительныеПараметры", Неопределено);
	Параметры.Вставить("События", Неопределено);
	
	Возврат Параметры;
	
КонецФункции

// Формирует параметры для создания реквизита формы.
// 
// Параметры:
//  Имя - Строка - Имя создаваемого реквизита
// 
// Возвращаемое значение:
//  Структура - Конструктор параметры команды формы:
// * Имя - Строка - Имя
// * ТипРеквизита - Строка - Тип реквизита
// * Путь - Строка - Путь
// * Заголовок - Строка - Заголовок
// * СохраняемыеДанные - Булево - Сохраняемые данные
Функция КонструкторПараметрыРеквизитФормы(Имя = "") Экспорт
	
	Параметры = Новый Структура;
		
	// Обязательные параметры к заполнению	
	Параметры.Вставить("Имя", Имя);
	
	// Не обязательные параметры к заполнению 
	Параметры.Вставить("ТипРеквизита", Неопределено);
	Параметры.Вставить("Путь", "");
	Параметры.Вставить("Заголовок", "");
	Параметры.Вставить("СохраняемыеДанные", Ложь);
	
	Возврат Параметры;
	
КонецФункции

// Формирует параметры для создания декорации формы.
// 
// Параметры:
//  Имя - Строка - Имя создаваемого элемента
//  Родитель - ГруппаФормы, ФормаКлиентскогоПриложения - Родитель нового элемента
// 
// Возвращаемое значение:
//  Структура - Конструктор параметры поля формы:
// * Имя - Строка - Имя
// * Родитель - ГруппаФормы - Родитель нового элемента
// * Вид - ВидДекорацииФормы - Вид декорации формы
// * Заголовок - Строка - Заголовок
// * ВставитьПередЭлементом - ЭлементФормы - Элемент формы, перед которым разместить новый элемент
// * ДополнительныеПараметры - Структура - ДополнительныеПараметры
// * События - Структура - События декорации
// * Подсказка - Строка - Подсказка
Функция КонструкторПараметрыДекорацииФормы(Имя = "", Родитель = Неопределено) Экспорт
	
	Параметры = Новый Структура;
	
	// Обязательные параметры к заполнению
	Параметры.Вставить("Имя", 						Имя);
	
	// Не обязательные параметры к заполнению
	Параметры.Вставить("Родитель", 					Родитель);
	Параметры.Вставить("Вид", 						ВидДекорацииФормы.Надпись);
	Параметры.Вставить("Заголовок", 				"");
	Параметры.Вставить("ВставитьПередЭлементом", 	Неопределено);
	Параметры.Вставить("ДополнительныеПараметры", 	Новый Структура);
	Параметры.Вставить("События", 					Новый Структура);
	
	Возврат Параметры;

КонецФункции

#КонецОбласти

#Область КонструкторыДополнительныхПараметров

// Формирует Дополнительные параметры группа без отображения
// 
// Возвращаемое значение:
//  Структура - Дополнительные параметры группа без отображения 
//
Функция ДополнительныеПараметрыГруппаБезОтображения() Экспорт
	
	ДополнительныеПараметры = Новый Структура;
	ДополнительныеПараметры.Вставить("Отображение", ОтображениеОбычнойГруппы.Нет);
	ДополнительныеПараметры.Вставить("ОтображатьЗаголовок", Ложь);
	Возврат ДополнительныеПараметры;
	
КонецФункции

#КонецОбласти

#Область Отборы

// См. ФормыУХ.НовыйОтбор 
Функция НовыйОтбор(Отбор, ЛевоеЗначение, ПравоеЗначение = Неопределено, ТипОтбора = Неопределено, ВидСравнения = Неопределено, ПравоеЗначениеПоле = Ложь) Экспорт
	Возврат ФормыУХ.НовыйОтбор(
		Отбор,
		ЛевоеЗначение,
		ПравоеЗначение,
		ТипОтбора,
		ВидСравнения,
		ПравоеЗначениеПоле);
КонецФункции

// См. ФормыУХ.НоваяГруппаИЛИ 
//@skip-check doc-comment-export-function-return-section
Функция НоваяГруппаИЛИ(Отбор) Экспорт
	Возврат ФормыУХ.НоваяГруппаИЛИ(Отбор);
КонецФункции

// См. ФормыУХ.НоваяГруппаИ
//@skip-check doc-comment-export-function-return-section
Функция НоваяГруппаИ(Отбор) Экспорт
	Возврат ФормыУХ.НоваяГруппаИ(Отбор);
КонецФункции

// См. ФормыУХ.НоваяГруппаНЕ 
//@skip-check doc-comment-export-function-return-section
Функция НоваяГруппаНЕ(Отбор) Экспорт
	Возврат ФормыУХ.НоваяГруппаНЕ(Отбор);
КонецФункции

// См. ФормыУХ.НайтиЭлементОтбора
Функция НайтиЭлементОтбора(ОтборКД, ИмяЭлемента, ЗначениеОтбора = "#НеУчитывать#", ВидСравнения = Неопределено) Экспорт
	Возврат ФормыУХ.НайтиЭлементОтбора(
		ОтборКД,
		ИмяЭлемента,
		ЗначениеОтбора,
		ВидСравнения);
КонецФункции

// См. ФормыУХ.ДобавитьЗависимыеПоля
Процедура ДобавитьЗависимыеПоля(Зависимости, ГлавноеПоле, ЗависимыеПоля) Экспорт
	ФормыУХ.ДобавитьЗависимыеПоля(Зависимости, ГлавноеПоле, ЗависимыеПоля);
КонецПроцедуры

// См. ФормыУХ.ДобавитьОформляемоеПоле
Функция ДобавитьОформляемоеПоле(КоллекцияОформляемыхПолей, ИмяПоля) Экспорт
	Возврат ФормыУХ.ДобавитьОформляемоеПоле(КоллекцияОформляемыхПолей, ИмяПоля);
КонецФункции

#КонецОбласти
		
// Заполнить список выбора элемента месяцами (номер и наименование)
// 
// Параметры:
//  Элемент - ПолеФормы - Элемент, список которого необходимо заполнить
Процедура ЗаполнитьСписокВыбораЭлементаМесяцами(Элемент) Экспорт

	Для Индекс = 01 По 12 Цикл
		Элемент.СписокВыбора.Добавить(Индекс, Формат(Дата(Год(ТекущаяДатаСеанса()), Индекс, 01), "ДФ=MMMM"));
	КонецЦикла;

КонецПроцедуры

// См. ФормыУХ.РазместитьВГруппеСтрокой
//@skip-check doc-comment-export-function-return-section
Функция РазместитьВГруппеСтрокой(Родитель, ПараметрыПолейВвода = Неопределено) Экспорт
	Возврат ФормыУХ.РазместитьВГруппеСтрокой(Родитель, ПараметрыПолейВвода);
КонецФункции

// См. ФормыУХ.РазместитьВГруппе
//@skip-check doc-comment-export-function-return-section
Функция РазместитьВГруппе(Родитель, ПараметрыПолейВвода = Неопределено) Экспорт
	Возврат ФормыУХ.РазместитьВГруппе(Родитель, ПараметрыПолейВвода);
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ПроверитьПараметрыДляСозданияЭлемента(Параметры)
	
	Если Параметры = Неопределено
		ИЛИ ТипЗнч(Параметры) <> Тип("Структура") Тогда
			
		Возврат Ложь;
	
	КонецЕсли;
		
	Если НЕ Параметры.Свойство("Имя")
		ИЛИ НЕ ЗначениеЗаполнено(Параметры.Имя) Тогда
			
		Возврат Ложь;
	
	КонецЕсли;
				
	Возврат Истина;
	
КонецФункции

Процедура ЗаполнитьНазначениеПослеПодбора(ТекущаяСтрока, СтрокаТовара) Экспорт

	// todo убрать данный метод в иное место
	ЗаполнитьЗначенияСвойств(ТекущаяСтрока, СтрокаТовара, "Назначение");
	
КонецПроцедуры

#КонецОбласти
