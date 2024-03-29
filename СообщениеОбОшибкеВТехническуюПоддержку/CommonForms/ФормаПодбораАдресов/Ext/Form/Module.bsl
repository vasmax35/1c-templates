﻿
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ПараметрыДляОтправкиПисьма = Новый Структура;
	
	ЗаполнитьПараметрДляОтправкиПисьма(ПараметрыДляОтправкиПисьма, Параметры, "АдресОтправителя", Отказ);
	ЗаполнитьПараметрДляОтправкиПисьма(ПараметрыДляОтправкиПисьма, Параметры, "Вложения", Отказ);
	ЗаполнитьПараметрДляОтправкиПисьма(ПараметрыДляОтправкиПисьма, Параметры, "Тело", Отказ);
	ЗаполнитьПараметрДляОтправкиПисьма(ПараметрыДляОтправкиПисьма, Параметры, "Тема", Отказ);
	ЗаполнитьПараметрДляОтправкиПисьма(ПараметрыДляОтправкиПисьма, Параметры, "ЭлектроннаяПочтаТекущегоПользователя", Отказ);
	
	Если Отказ Тогда
		Возврат;
	КонецЕсли;
	
	СформироватьТаблицуПользователей();

КонецПроцедуры

&НаКлиенте
Процедура ПередЗакрытием(Отказ, ЗавершениеРаботы, ТекстПредупреждения, СтандартнаяОбработка)
	УдалитьДанныеИзВременногоХранилища();
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ДобавитьВПолучателиПисьма(Команда)
	
	МассивИндексовВыделенныхСтрок = Элементы.СписокПользователей.ВыделенныеСтроки;
	
	Если Не МассивИндексовВыделенныхСтрок.Количество() Тогда
		Возврат;
	КонецЕсли;
	
	Для Каждого НомерСтроки Из МассивИндексовВыделенныхСтрок Цикл
		СтрокаПользователь = СписокПользователей.НайтиПоИдентификатору(НомерСтроки);
		ДобавитьСтрокуВПолучателиСПроверкой(СтрокаПользователь);
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьВсеВПолучателиПисьма(Команда)
	
	Для Каждого СтрокаПользователь Из СписокПользователей Цикл
		ДобавитьСтрокуВПолучателиСПроверкой(СтрокаПользователь);
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура УбратьИзПолучателиПисьма(Команда)
	
	ТекущиеДанные = Элементы.ПолучателиПисьма.ТекущиеДанные;
	
	Если ТекущиеДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	ПолучателиПисьма.Удалить(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УбратьВсеИзПолучателиПисьма(Команда)
	ПолучателиПисьма.Очистить();
КонецПроцедуры

&НаКлиенте
Процедура ОтправитьПисьмо(Команда)
	
	Если Не ПолучателиПисьма.Количество() Тогда
		ТекстСообщения = НСтр("ru = 'Не заполнены получатели письма.'");
		ПоказатьПредупреждение(, ТекстСообщения);
		Возврат;
	КонецЕсли;
	
	ОтправитьПисьмоПользователямИнформационнойБазы();
	
	ТекстСообщения = НСтр("ru = 'Электронное письмо отправлено на указанные адреса.%1Автор письма ставится в получатели по умолчанию.'");
	ТекстОтправлено = СтрШаблон(ТекстСообщения, Символы.ПС);
	
	Оповещение = Новый ОписаниеОповещения("ПослеОтправкиПисьма", ЭтотОбъект);
	ПоказатьПредупреждение(Оповещение, ТекстОтправлено);
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура СформироватьТаблицуПользователей()
	
	ТекущийПользователь = Пользователи.ТекущийПользователь();
	
	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ РАЗРЕШЕННЫЕ
	               |	ПользователиКонтактнаяИнформация.Ссылка КАК Ссылка,
	               |	ПользователиКонтактнаяИнформация.АдресЭП КАК АдресЭП
	               |ПОМЕСТИТЬ ВТ_АдресаЭлектроннойПочты
	               |ИЗ
	               |	Справочник.Пользователи.КонтактнаяИнформация КАК ПользователиКонтактнаяИнформация
	               |ГДЕ
	               |	ПользователиКонтактнаяИнформация.Вид = &EmailПользователя
	               |
	               |ИНДЕКСИРОВАТЬ ПО
	               |	Ссылка
	               |;
	               |
	               |////////////////////////////////////////////////////////////////////////////////
	               |ВЫБРАТЬ РАЗРЕШЕННЫЕ
	               |	Пользователи.Ссылка КАК Пользователь,
	               |	ВТ_АдресаЭлектроннойПочты.АдресЭП КАК АдресЭлектроннойПочты,
	               |	НЕ ВТ_АдресаЭлектроннойПочты.АдресЭП ЕСТЬ NULL КАК ЗаполненАдрес
	               |ИЗ
	               |	Справочник.Пользователи КАК Пользователи
	               |		ЛЕВОЕ СОЕДИНЕНИЕ ВТ_АдресаЭлектроннойПочты КАК ВТ_АдресаЭлектроннойПочты
	               |		ПО Пользователи.Ссылка = ВТ_АдресаЭлектроннойПочты.Ссылка
	               |ГДЕ
	               |	Пользователи.Ссылка <> &ТекущийПользователь
	               |	И НЕ Пользователи.ПометкаУдаления
	               |
	               |УПОРЯДОЧИТЬ ПО
	               |	Пользователи.Наименование";
	
	Запрос.УстановитьПараметр("EmailПользователя", ПредопределенноеЗначение("Справочник.ВидыКонтактнойИнформации.EmailПользователя"));
	Запрос.УстановитьПараметр("ТекущийПользователь", ТекущийПользователь);
	
	РезультатЗапроса = Запрос.Выполнить();
			
	Если Не РезультатЗапроса.Пустой() Тогда
		ТЗСписокПользователей = РезультатЗапроса.Выгрузить();
		ЗначениеВРеквизитФормы(ТЗСписокПользователей, "СписокПользователей");
	КонецЕсли;

КонецПроцедуры

&НаКлиенте
Функция ПроверкаУжеИмеющегосяАдресаВПолучателях(АдресЭлектроннойПочты)
	
	СтруктураОтбора = Новый Структура;
	СтруктураОтбора.Вставить("АдресЭлектроннойПочты", АдресЭлектроннойПочты);
	
	НайденнаяСтрока = ПолучателиПисьма.НайтиСтроки(СтруктураОтбора);
	
	Возврат НайденнаяСтрока.Количество();
	
КонецФункции

&НаКлиенте
Процедура ТолькоКонтактыСАдресамиПриИзменении(Элемент)
	
	СтруктураПоиска = Новый Структура;
	
	Если ТолькоКонтактыСАдресами Тогда
		СтруктураПоиска.Вставить("ЗаполненАдрес", Истина);
	КонецЕсли;
	
	Элементы.СписокПользователей.ОтборСтрок = Новый ФиксированнаяСтруктура(СтруктураПоиска);
	
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьСтрокуВПолучателиСПроверкой(СтрокаПользователь)

	Если Не СтрокаПользователь.ЗаполненАдрес Тогда
		Возврат;
	КонецЕсли;
	
	ЕстьТакойАдрес = ПроверкаУжеИмеющегосяАдресаВПолучателях(СтрокаПользователь.АдресЭлектроннойПочты);
	
	Если Не ЕстьТакойАдрес Тогда
		НоваяСтрокаПолучатель = ПолучателиПисьма.Добавить();
		ЗаполнитьЗначенияСвойств(НоваяСтрокаПолучатель, СтрокаПользователь);
	КонецЕсли;

КонецПроцедуры

&НаСервере
Процедура ОтправитьПисьмоПользователямИнформационнойБазы()

	СтрокаПолучатели = СформироватьСтрокуАдресовДляОтправкиПисьма();
	ПараметрыДляОтправкиПисьма.Вставить("Кому", СтрокаПолучатели);
	АдресОтправителя = ПараметрыДляОтправкиПисьма.АдресОтправителя;
	РаботаСПочтовымиСообщениями.ОтправитьПочтовоеСообщение(АдресОтправителя, ПараметрыДляОтправкиПисьма);
	
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьПараметрДляОтправкиПисьма(ПараметрыДляОтправкиПисьма, Параметры, ИмяСвойства, Отказ)
	
	СвойствоСтруктуры = ОбщегоНазначенияКлиентСервер.СвойствоСтруктуры(Параметры, ИмяСвойства);
	
	Если СвойствоСтруктуры <> Неопределено Тогда
		ПараметрыДляОтправкиПисьма.Вставить(ИмяСвойства, СвойствоСтруктуры);
	Иначе
		Отказ = Истина;
	КонецЕсли;

КонецПроцедуры

&НаСервере
Функция СформироватьСтрокуАдресовДляОтправкиПисьма()
	
	ТЗПолучателиПисьма = РеквизитФормыВЗначение("ПолучателиПисьма");
	МассивАдресов = ТЗПолучателиПисьма.ВыгрузитьКолонку("АдресЭлектроннойПочты");
	
	ЭлектроннаяПочтаТекущегоПользователя = ПараметрыДляОтправкиПисьма.ЭлектроннаяПочтаТекущегоПользователя;
	
	Если ЗначениеЗаполнено(ЭлектроннаяПочтаТекущегоПользователя) Тогда
		МассивАдресов.Добавить(ЭлектроннаяПочтаТекущегоПользователя);
	КонецЕсли;
	
	Возврат СтрСоединить(МассивАдресов, ";");
	
КонецФункции

&НаКлиенте
Процедура УдалитьДанныеИзВременногоХранилища()

	Вложения = ОбщегоНазначенияКлиентСервер.СвойствоСтруктуры(ПараметрыДляОтправкиПисьма, "Вложения");
	
	Если Вложения <> Неопределено Тогда
		
		Для Каждого Вложение Из Вложения Цикл
			
			АдресВоВременномХранилище = ОбщегоНазначенияКлиентСервер.СвойствоСтруктуры(Вложение, "АдресВоВременномХранилище");
			
			Если АдресВоВременномХранилище <> Неопределено Тогда
            	УдалитьИзВременногоХранилища(АдресВоВременномХранилище);
			КонецЕсли;
			
		КонецЦикла;
		
	КонецЕсли;

КонецПроцедуры

&НаКлиенте
Процедура ПослеОтправкиПисьма(ДополнительныеПараметры) Экспорт
	Закрыть();
КонецПроцедуры
	
#КонецОбласти
