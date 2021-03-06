/* Copyright (c) 2013 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#ifndef ApplicationUI_HPP_
#define ApplicationUI_HPP_

#include <QObject>
#include <QtCore/QObject>
#include <QtCore/QVariant>
#include <QtCore/QDateTime>
#include "RequestHeaders.hpp"
#include <math.h>

namespace bb
{
    namespace cascades
    {
        class Application;
        class LocaleHandler;
        class ListView;
    }
}

class QTranslator;

/*!
 * @brief Application object
 *
 *
 */

class ApplicationUI : public QObject
{
    Q_OBJECT
public:
    ApplicationUI(bb::cascades::Application *app);
    virtual ~ApplicationUI() { }
    // Converts the passed QString to an UTF-8 encoded QByteArray
    Q_INVOKABLE QByteArray encodeQString(const QString& toEncode) const;
Q_SIGNALS:
    void refreshDone();
    void refresh();
private slots:
    void onSystemLanguageChanged();
    void onDataComplete(QMap<QString, QVariant> result);
    void onRefresh();
private:
    QTranslator* m_pTranslator;
    bb::cascades::ListView* roomListView;
    bb::cascades::LocaleHandler* m_pLocaleHandler;
    void setUpRoomListModel(bb::cascades::ListView *roomList);
};

#endif /* ApplicationUI_HPP_ */
