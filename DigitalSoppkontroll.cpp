#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>

const QString CONFIG_PATH       = "/home/phablet/.config/DigitalSoppkontroll";
const QString CACHE_PATH        = "/home/phablet/.cache/DigitalSoppkontroll";
const QString PROFILES_PATH     = CONFIG_PATH + "/profiles.sqlite";
const QString DATABASE_PATH_FMT = CONFIG_PATH + "/%1/database.db";

const QString PROFILE_DIR_FMT   = CACHE_PATH + "/%1/downloads/%2/profile";
const QString PROFILE_FILE_FMT  = "file://" + CACHE_PATH + "/%1/downloads/%2/profile/%3";

int main(int argc, char *argv[])
{
    QGuiApplication::setOrganizationName("Norges sopp- og nyttevekstforbund");
    QGuiApplication::setApplicationName("DigitalSoppkontroll");
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    QQuickStyle::setStyle("Suru");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/DigitalSoppkontroll.qml")));

    return app.exec();
}
