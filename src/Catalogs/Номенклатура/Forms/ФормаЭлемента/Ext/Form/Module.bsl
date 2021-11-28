﻿
&НаКлиентеПроцедура СсылкаНаКартинкуНажатие(Элемент, СтандартнаяОбработка)	СтандартнаяОбработка = Ложь; 	Режим = РежимДиалогаВыбораФайла.Открытие; 	ДиалогОткрытия = Новый ДиалогВыбораФайла(Режим); 	ДиалогОткрытия.ПолноеИмяФайла = ""; 	Фильтр = "Файл Jpg (*.jpg)|*.jpg"; 	ДиалогОткрытия.Фильтр = Фильтр; 	ДиалогОткрытия.МножественныйВыбор = Ложь; 	ДиалогОткрытия.Заголовок = "Выберете файл для загрузки"; 	ОписаниеОповещения = Новый ОписаниеОповещения("ПослеЗагрузкиФайла",ЭтаФорма); 	ДиалогОткрытия.Показать(ОписаниеОповещения);	КонецПроцедуры        

&НаКлиенте Процедура ПослеЗагрузкиФайла(ВыбранныйФайл,ДопПараметр) Экспорт 	Если ВыбранныйФайл = Неопределено Тогда 		Возврат; 	КонецЕсли; 	ОписаниеОповещения = Новый ОписаниеОповещения("ПослеПомещенияФайла", ЭтаФорма); 	НачатьПомещениеФайла(ОписаниеОповещения,, ВыбранныйФайл[0], Ложь, УникальныйИдентификатор); КонецПроцедуры      

&НаКлиенте Процедура ПослеПомещенияФайла(Результат, Адрес, ВыбранноеИмяФайла,ДопПараметры) Экспорт 	Если Не Результат Тогда 		Возврат; 	КонецЕсли; 	СсылкаНаКартинку = Адрес; 	Модифицированность = Истина; КонецПроцедуры

&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	Если ЭтоАдресВременногоХранилища(СсылкаНаКартинку)  Тогда 		ФайлКартинки = ПолучитьИзВременногоХранилища(СсылкаНаКартинку); 		ТекущийОбъект.Картинка = Новый ХранилищеЗначения(ФайлКартинки); 		УдалитьИзВременногоХранилища(СсылкаНаКартинку); 		СсылкаНаКартинку = ПолучитьНавигационнуюСсылку(Объект.Ссылка,"Картинка"); 	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	СсылкаНаКартинку = ПолучитьНавигационнуюСсылку(Объект.Ссылка,"Картинка");     Элементы.СсылкаНаКартинку.РазмерКартинки = РазмерКартинки.АвтоРазмер;
КонецПроцедуры        

