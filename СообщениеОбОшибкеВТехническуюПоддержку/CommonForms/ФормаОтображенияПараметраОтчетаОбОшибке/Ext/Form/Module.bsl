﻿
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	ЗаполнитьРеквизитыФормыИУстановитьВидимостьЭлементов(Параметры);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ОК(Команда)
	
	Если ЭтоАдресВременногоХранилища(СсылкаНаКартинку) Тогда
		УдалитьИзВременногоХранилища(СсылкаНаКартинку);
	КонецЕсли;
	
	Закрыть();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура ЗаполнитьРеквизитыФормыИУстановитьВидимостьЭлементов(Параметры)

	Заголовок = Неопределено;
	
	ЗначениеДляОтображения = ОбщегоНазначенияКлиентСервер.СвойствоСтруктуры(Параметры, "ЗначениеПоказать");
	Если ЗначениеДляОтображения <> Неопределено Тогда
		
		ЭтоСкриншот = (ТипЗнч(ЗначениеДляОтображения) = Тип("ХранилищеЗначения"));
		
		Если ЭтоСкриншот Тогда
			СсылкаНаКартинку = ПоместитьВоВременноеХранилище(ЗначениеДляОтображения.Получить());
		Иначе
			ПараметрСтрока = ЗначениеДляОтображения;
		КонецЕсли;
		
		Элементы.СсылкаНаКартинку.Видимость = ЭтоСкриншот;
		Элементы.ПараметрСтрока.Видимость = Не ЭтоСкриншот;
		
	КонецЕсли;

КонецПроцедуры

#КонецОбласти
