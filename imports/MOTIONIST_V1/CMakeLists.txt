### This file is automatically generated by Qt Design Studio.
### Do not change

qt_add_library(MOTIONIST_V1 STATIC)
set_source_files_properties(Constants.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
    )

qt6_add_qml_module(MOTIONIST_V1
	URI "MOTIONIST_V1"
	VERSION 1.0
	QML_FILES
		Constants.qml
		DirectoryFontLoader.qml
		EventListModel.qml
		EventListSimulator.qml
)
