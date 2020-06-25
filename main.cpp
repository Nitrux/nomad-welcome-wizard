#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "Helper.h"
#include "ShellHelper.h"

Helper* helper = nullptr;

static QObject* helperSingletonProvider(QQmlEngine* engine,
                                        QJSEngine* scriptEngine) {
  Q_UNUSED(engine)
  Q_UNUSED(scriptEngine)

  if (helper == nullptr) {
    helper = new Helper();
  }

  return helper;
}

int main(int argc, char* argv[]) {
  const char* uri = "org.nxos.welcomewizard";
  QGuiApplication app(argc, argv);

  qmlRegisterSingletonType<Helper>(uri, 1, 0, "Helper",
                                   helperSingletonProvider);
  qmlRegisterType<ShellHelper>(uri, 1, 0, "ShellHelper");

  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
  QQmlApplicationEngine engine;
  engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
  if (engine.rootObjects().isEmpty()) return -1;

  return app.exec();
}
