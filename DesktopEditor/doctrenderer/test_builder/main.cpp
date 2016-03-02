#include "../docbuilder.h"

#define AVS_OFFICESTUDIO_FILE_DOCUMENT					0x0040
#define AVS_OFFICESTUDIO_FILE_DOCUMENT_DOCX				AVS_OFFICESTUDIO_FILE_DOCUMENT + 0x0001
#define AVS_OFFICESTUDIO_FILE_DOCUMENT_DOC				AVS_OFFICESTUDIO_FILE_DOCUMENT + 0x0002
#define AVS_OFFICESTUDIO_FILE_DOCUMENT_ODT				AVS_OFFICESTUDIO_FILE_DOCUMENT + 0x0003
#define AVS_OFFICESTUDIO_FILE_DOCUMENT_RTF				AVS_OFFICESTUDIO_FILE_DOCUMENT + 0x0004
#define AVS_OFFICESTUDIO_FILE_DOCUMENT_TXT				AVS_OFFICESTUDIO_FILE_DOCUMENT + 0x0005
#define AVS_OFFICESTUDIO_FILE_DOCUMENT_HTML				AVS_OFFICESTUDIO_FILE_DOCUMENT + 0x0006
#define AVS_OFFICESTUDIO_FILE_DOCUMENT_MHT				AVS_OFFICESTUDIO_FILE_DOCUMENT + 0x0007
#define AVS_OFFICESTUDIO_FILE_DOCUMENT_EPUB				AVS_OFFICESTUDIO_FILE_DOCUMENT + 0x0008
#define AVS_OFFICESTUDIO_FILE_DOCUMENT_FB2				AVS_OFFICESTUDIO_FILE_DOCUMENT + 0x0009
#define AVS_OFFICESTUDIO_FILE_DOCUMENT_MOBI				AVS_OFFICESTUDIO_FILE_DOCUMENT + 0x000a

#define AVS_OFFICESTUDIO_FILE_PRESENTATION				0x0080
#define AVS_OFFICESTUDIO_FILE_PRESENTATION_PPTX			AVS_OFFICESTUDIO_FILE_PRESENTATION + 0x0001
#define AVS_OFFICESTUDIO_FILE_PRESENTATION_PPT			AVS_OFFICESTUDIO_FILE_PRESENTATION + 0x0002
#define AVS_OFFICESTUDIO_FILE_PRESENTATION_ODP			AVS_OFFICESTUDIO_FILE_PRESENTATION + 0x0003
#define AVS_OFFICESTUDIO_FILE_PRESENTATION_PPSX			AVS_OFFICESTUDIO_FILE_PRESENTATION + 0x0004

#define AVS_OFFICESTUDIO_FILE_SPREADSHEET				0x0100
#define AVS_OFFICESTUDIO_FILE_SPREADSHEET_XLSX			AVS_OFFICESTUDIO_FILE_SPREADSHEET + 0x0001
#define AVS_OFFICESTUDIO_FILE_SPREADSHEET_XLS			AVS_OFFICESTUDIO_FILE_SPREADSHEET + 0x0002
#define AVS_OFFICESTUDIO_FILE_SPREADSHEET_ODS			AVS_OFFICESTUDIO_FILE_SPREADSHEET + 0x0003
#define AVS_OFFICESTUDIO_FILE_SPREADSHEET_CSV			AVS_OFFICESTUDIO_FILE_SPREADSHEET + 0x0004

#define AVS_OFFICESTUDIO_FILE_CROSSPLATFORM				0x0200
#define AVS_OFFICESTUDIO_FILE_CROSSPLATFORM_PDF			AVS_OFFICESTUDIO_FILE_CROSSPLATFORM + 0x0001
#define AVS_OFFICESTUDIO_FILE_CROSSPLATFORM_DJVU		AVS_OFFICESTUDIO_FILE_CROSSPLATFORM + 0x0003
#define AVS_OFFICESTUDIO_FILE_CROSSPLATFORM_XPS			AVS_OFFICESTUDIO_FILE_CROSSPLATFORM + 0x0004

int main(int argc, char *argv[])
{
    NSDoctRenderer::CDocBuilder oBuilder;

    // tmpfolder
    oBuilder.SetTmpFolder(L"D:/BuilderTest");

#if 1
    oBuilder.CreateFile(AVS_OFFICESTUDIO_FILE_DOCUMENT_DOCX);
    oBuilder.ExecuteCommand(L"Add_Text(\"Oleg\");");
#endif

#if 0
    oBuilder.OpenFile(L"D:/TESTFILES/images.docx", L"");
#endif

    oBuilder.SaveFile(AVS_OFFICESTUDIO_FILE_CROSSPLATFORM_PDF, L"D:/TESTFILES/images.pdf");

    return 0;
}