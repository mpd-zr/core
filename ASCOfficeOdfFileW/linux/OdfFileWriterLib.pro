#-------------------------------------------------
#
# Project created by QtCreator 2015-06-07T13:03:16
#
#-------------------------------------------------

QT       -= core gui

TARGET = OdfFileWriterLib
TEMPLATE = lib
CONFIG += staticlib

CONFIG += c++11

win32 {
    QMAKE_CXXFLAGS_RELEASE -= -Zc:strictStrings
} else {
    QMAKE_CXXFLAGS += -std=c++11 -Wall -Wno-ignored-qualifiers
}
############### destination path ###############
DESTINATION_SDK_PATH = $$PWD/../../SDK/lib

# WINDOWS
win32:contains(QMAKE_TARGET.arch, x86_64):{
CONFIG(debug, debug|release) {
    DESTDIR = $$DESTINATION_SDK_PATH/win_64/DEBUG
} else {
    DESTDIR = $$DESTINATION_SDK_PATH/win_64
}
}
win32:!contains(QMAKE_TARGET.arch, x86_64):{
CONFIG(debug, debug|release) {
    DESTDIR = $$DESTINATION_SDK_PATH/win_32/DEBUG
} else {
    DESTDIR = $$DESTINATION_SDK_PATH/win_32
}
}

linux-g++ | linux-g++-64 | linux-g++-32:contains(QMAKE_HOST.arch, x86_64):{
    DESTDIR = $$DESTINATION_SDK_PATH/linux_64
}
linux-g++ | linux-g++-64 | linux-g++-32:!contains(QMAKE_HOST.arch, x86_64):{
    DESTDIR = $$DESTINATION_SDK_PATH/linux_32
}

mac {
    DESTDIR = $$DESTINATION_SDK_PATH/mac_64
}
############### destination path ###############

DEFINES +=  UNICODE \
            _UNICODE \
            _USE_LIBXML2_READER_ \
            _USE_XMLLITE_READER_ \
            USE_LITE_READER

INCLUDEPATH += ../../DesktopEditor/freetype-2.5.2/include
INCLUDEPATH += ../../ASCOfficeOdfFile/include
INCLUDEPATH += ../../ASCOfficeOdfFile/src/odf/datatypes

#################### WINDOWS #####################
win32 {
    DEFINES += \
        LIBXML_READER_ENABLED

INCLUDEPATH += ../../Common/DocxFormat/Source/XML/libxml2/XML/include
INCLUDEPATH += C:/boost_1_58_0
}
#################### WINDOWS #####################

#################### LINUX ########################
linux-g++ | linux-g++-64 | linux-g++-32 {
    DEFINES += \
        LINUX \
        _LINUX \
        _LINUX_QT

INCLUDEPATH += /usr/include/libxml2
}

mac {
    DEFINES += \
        LINUX \
        _LINUX \
        _LINUX_QT \
        _MAC \
        MAC \
        _MAC_NO_APPLE \
        LIBXML_READER_ENABLED

INCLUDEPATH += ../../Common/DocxFormat/Source/XML/libxml2/XML/include
INCLUDEPATH += ../../Common/boost_1_58_0
}
#################### LINUX ########################

CONFIG(debug, debug|release){
DEFINES +=  _DEBUG
}


SOURCES += \
    ../source/OdfFormat/abstract_xml.cpp \
    ../source/OdfFormat/calcext_elements.cpp \
    ../source/OdfFormat/draw_base.cpp \
    ../source/OdfFormat/draw_frame.cpp \
    ../source/OdfFormat/draw_shapes.cpp \
    ../source/OdfFormat/header_footer.cpp \
    ../source/OdfFormat/list.cpp \
    ../source/OdfFormat/mediaitems.cpp \
    ../source/OdfFormat/mediaitems_utils.cpp \
    ../source/OdfFormat/number_style.cpp \
    ../source/OdfFormat/object_package.cpp \
    ../source/OdfFormat/odf_chart_context.cpp \
    ../source/OdfFormat/odf_comment_context.cpp \
    ../source/OdfFormat/odf_conversion_context.cpp \
    ../source/OdfFormat/odf_drawing_context.cpp \
    ../source/OdfFormat/odf_lists_styles_context.cpp \
    ../source/OdfFormat/odf_number_styles_context.cpp \
    ../source/OdfFormat/odf_page_layout_context.cpp \
    ../source/OdfFormat/odf_page_layout_state.cpp \
    ../source/OdfFormat/odf_rels.cpp \
    ../source/OdfFormat/odf_style_context.cpp \
    ../source/OdfFormat/odf_style_state.cpp \
    ../source/OdfFormat/odf_table_context.cpp \
    ../source/OdfFormat/odf_table_styles_context.cpp \
    ../source/OdfFormat/odf_text_context.cpp \
    ../source/OdfFormat/ods_conversion_context.cpp \
    ../source/OdfFormat/ods_table_context.cpp \
    ../source/OdfFormat/ods_table_state.cpp \
    ../source/OdfFormat/odt_conversion_context.cpp \
    ../source/OdfFormat/office_annotation.cpp \
    ../source/OdfFormat/office_body.cpp \
    ../source/OdfFormat/office_chart.cpp \
    ../source/OdfFormat/office_elements_create.cpp \
    ../source/OdfFormat/office_spreadsheet.cpp \
    ../source/OdfFormat/office_text.cpp \
    ../source/OdfFormat/oox_shape_defines.cpp \
    ../source/OdfFormat/paragraph_elements.cpp \
    ../source/OdfFormat/style_chart_properties.cpp \
    ../source/OdfFormat/style_graphic_properties.cpp \
    ../source/OdfFormat/style_map.cpp \
    ../source/OdfFormat/style_page_layout_properties.cpp \
    ../source/OdfFormat/style_paragraph_properties.cpp \
    ../source/OdfFormat/styles.cpp \
    ../source/OdfFormat/style_section_properties.cpp \
    ../source/OdfFormat/styles_list.cpp \
    ../source/OdfFormat/styles_lite_container.cpp \
    ../source/OdfFormat/style_table_properties.cpp \
    ../source/OdfFormat/style_text_properties.cpp \
    ../source/OdfFormat/svg_creator.cpp \
    ../source/OdfFormat/table.cpp \
    ../source/OdfFormat/table_database_ranges.cpp \
    ../source/OdfFormat/table_named_expressions.cpp \
    ../source/OdfFormat/text_elements.cpp \
    ../source/Oox2OdfConverter/ConvertDiagram.cpp \
    ../source/Oox2OdfConverter/Converter.cpp \
    ../source/Oox2OdfConverter/ConverterChart.cpp \
    ../source/Oox2OdfConverter/ConvertVml.cpp \
    ../source/Oox2OdfConverter/DocxConverter.cpp \
    ../source/Oox2OdfConverter/XlsxConverter.cpp


HEADERS += \
    ../source/OdfFormat/abstract_xml.h \
    ../source/OdfFormat/calcext_elements.h \
    ../source/OdfFormat/draw_base.h \
    ../source/OdfFormat/draw_frame.h \
    ../source/OdfFormat/draw_shapes.h \
    ../source/OdfFormat/header_footer.h \
    ../source/OdfFormat/list.h \
    ../source/OdfFormat/mediaitems.h \
    ../source/OdfFormat/mediaitems_utils.h \
    ../source/OdfFormat/number_style.h \
    ../source/OdfFormat/object_package.h \
    ../source/OdfFormat/odf_chart_context.h \
    ../source/OdfFormat/odf_comment_context.h \
    ../source/OdfFormat/odf_conversion_context.h \
    ../source/OdfFormat/odf_drawing_context.h \
    ../source/OdfFormat/odf_lists_styles_context.h \
    ../source/OdfFormat/odf_number_styles_context.h \
    ../source/OdfFormat/odf_page_layout_context.h \
    ../source/OdfFormat/odf_page_layout_state.h \
    ../source/OdfFormat/odf_rels.h \
    ../source/OdfFormat/odf_style_context.h \
    ../source/OdfFormat/odf_style_state.h \
    ../source/OdfFormat/odf_table_context.h \
    ../source/OdfFormat/odf_table_styles_context.h \
    ../source/OdfFormat/odf_text_context.h \
    ../source/OdfFormat/ods_conversion_context.h \
    ../source/OdfFormat/ods_table_context.h \
    ../source/OdfFormat/ods_table_state.h \
    ../source/OdfFormat/odt_conversion_context.h \
    ../source/OdfFormat/office_annotation.h \
    ../source/OdfFormat/office_body.h \
    ../source/OdfFormat/office_chart.h \
    ../source/OdfFormat/office_elements.h \
    ../source/OdfFormat/office_elements_create.h \
    ../source/OdfFormat/office_elements_type.h \
    ../source/OdfFormat/office_spreadsheet.h \
    ../source/OdfFormat/office_text.h \
    ../source/OdfFormat/oox_shape_defines.h \
    ../source/OdfFormat/paragraph_elements.h \
    ../source/OdfFormat/style_chart_properties.h \
    ../source/OdfFormat/style_graphic_properties.h \
    ../source/OdfFormat/style_map.h \
    ../source/OdfFormat/style_page_layout_properties.h \
    ../source/OdfFormat/style_paragraph_properties.h \
    ../source/OdfFormat/styles.h \
    ../source/OdfFormat/style_section_properties.h \
    ../source/OdfFormat/styles_list.h \
    ../source/OdfFormat/styles_lite_container.h \
    ../source/OdfFormat/style_table_properties.h \
    ../source/OdfFormat/style_text_properties.h \
    ../source/OdfFormat/svg_creator.h \
    ../source/OdfFormat/table.h \
    ../source/OdfFormat/table_database_ranges.h \
    ../source/OdfFormat/table_named_expressions.h \
    ../source/OdfFormat/text_elements.h \
    ../source/OdfFormat/visitor.h \
    ../source/Oox2OdfConverter/Converter.h \
    ../source/Oox2OdfConverter/DocxConverter.h \
    ../source/Oox2OdfConverter/Oox2OdfConverter.h \
    ../source/Oox2OdfConverter/VmlShapeTypes2Oox.h \
    ../source/Oox2OdfConverter/XlsxConverter.h \
    ../source/OdfFormat/Shapes/odf_shape_mapping.h \
    ../source/OdfFormat/Shapes/oox_shapeAccentCallouts.h \
    ../source/OdfFormat/Shapes/oox_shapeActionButtons.h \
    ../source/OdfFormat/Shapes/oox_shapeArrows.h \
    ../source/OdfFormat/Shapes/oox_shapeBents.h \
    ../source/OdfFormat/Shapes/oox_shapeCallouts.h \
    ../source/OdfFormat/Shapes/oox_shapeCharts.h \
    ../source/OdfFormat/Shapes/oox_shapeConnectors.h \
    ../source/OdfFormat/Shapes/oox_shapeCurvedArrows.h \
    ../source/OdfFormat/Shapes/oox_shapeCurvedConnectors.h \
    ../source/OdfFormat/Shapes/oox_shapeCustoms.h \
    ../source/OdfFormat/Shapes/oox_shapeMaths.h \
    ../source/OdfFormat/Shapes/oox_shapePrimitives.h \
    ../source/OdfFormat/Shapes/oox_shapeRibbons.h \
    ../source/OdfFormat/Shapes/oox_shapeSnipRoundRects.h \
    ../source/OdfFormat/Shapes/oox_shapeStars.h \
    ../source/OdfFormat/Shapes/oox_shapeWordArt.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}
