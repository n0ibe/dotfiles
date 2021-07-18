import subprocess
import sys

POWER_ICON = ' '
FORMAT_MENU = """\
{shutdown}
{reboot}
{suspend}
"""


def __shutdown():
    subprocess.run(['sudo', 'shutdown', '--poweroff', 'now'])


def __reboot():
    subprocess.run(['sudo', 'shutdown', '--reboot', 'now'])


def __suspend():
    subprocess.run(['systemctl', 'suspend'])


def show_menu():
    """Launches dmenu with the options to shutdown, reboot or suspend the
    machine."""
    shutdown = 'Shutdown'
    reboot = 'Reboot'
    suspend = 'Suspend'

    options = FORMAT_MENU.format(
        shutdown=shutdown,
        reboot=reboot,
        suspend=suspend,
    )

    selection = subprocess.run(
        ['dmenu', '-p', POWER_ICON],
        capture_output=True,
        text=True,
        input=options,
    ).stdout.rstrip()

    if not selection:
        sys.exit()

    elif selection == shutdown:
        __shutdown()

    elif selection == reboot:
        __reboot()

    elif selection == suspend:
        __suspend()


if __name__ == '__main__':
    show_menu()
