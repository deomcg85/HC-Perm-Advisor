// ============================================================
//  HC_Perm_Advisor_install.ash
//  Installer for the Hardcore Skill Perm Advisor
//
//  Downloads the latest version of HC_Perm_Advisor.ash and
//  HC_Perm_Advisor_data.ash from GitHub and saves them to
//  your KoLmafia scripts folder automatically.
//
//  USAGE:
//    call HC_Perm_Advisor_install.ash
//
//  Run this once to install, and again any time you want
//  to update to the latest version.
// ============================================================

string BASE_URL  = "https://raw.githubusercontent.com/deomcg85/HC-Perm-Advisor/main/";
string MAIN_FILE = "HC_Perm_Advisor.ash";
string DATA_FILE = "HC_Perm_Advisor_data.ash";
string DEST_PATH = "scripts/";

void fetch_and_save(string filename) {
    string url = BASE_URL + filename;
    string dest = DEST_PATH + filename;

    print("Fetching " + filename + "...", "black");
    string content = visit_url(url);

    if (length(content) == 0) {
        print("ERROR: Could not fetch " + filename + ".", "red");
        print("Check your internet connection and that KoLmafia is not auto-adventuring.", "red");
        return;
    }

    if (index_of(content, "404") == 0 || index_of(content, "Not Found") >= 0) {
        print("ERROR: File not found on GitHub: " + filename, "red");
        return;
    }

    print("Saving to " + dest + "...", "black");
    buffer b;
    b.append(content);
    boolean ok = buffer_to_file(b, dest);

    if (ok) {
        print(filename + " installed successfully! (" + length(content) + " bytes)", "green");
    } else {
        print("ERROR: Could not write " + dest + " to disk.", "red");
        print("Check that KoLmafia has write permission to your scripts folder.", "red");
    }
}

void main(string arg) {
    print("", "");
    print("=============================================================", "blue");
    print("  Hardcore Skill Perm Advisor -- Installer", "blue");
    print("  https://github.com/deomcg85/HC-Perm-Advisor", "blue");
    print("=============================================================", "blue");
    print("", "");
    print("Installing to: " + DEST_PATH, "gray");
    print("", "");

    fetch_and_save(DATA_FILE);
    print("", "");
    fetch_and_save(MAIN_FILE);

    print("", "");
    print("Done! Run the advisor with:", "black");
    print("  call HC_Perm_Advisor.ash", "blue");
    print("", "");
}
