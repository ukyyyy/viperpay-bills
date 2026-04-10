set -e

echo "
╔═══════════════════════════════════════════════════════════╗
║                                                           ║
║   ██╗   ██╗██╗██████╗ ███████╗██████╗ ██████╗  █████╗ ██╗ ║
║   ██║   ██║██║██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔══██╗╚██╗║
║   ██║   ██║██║██████╔╝█████╗  ██████╔╝██████╔╝███████║ ██║║
║   ╚██╗ ██╔╝██║██╔═══╝ ██╔══╝  ██╔══██╗██╔═══╝ ██╔══██║ ██║║
║    ╚████╔╝ ██║██║     ███████╗██║  ██║██║     ██║  ██║██╔╝║
║     ╚═══╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚═╝ ║
║                                                           ║
║                    B I L L S                              ║
║                                                           ║
║   Professionelle Rechnungssoftware für Deutschland        ║
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
"

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo"❌ Docker ist nicht installiert!\"
    echo"   Bitte installieren Sie Docker: https://docs.docker.com/get-docker/\"
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null && ! docker compose version &> /dev/null; then
    echo"❌ Docker Compose ist nicht installiert!\"
    echo"   Bitte installieren Sie Docker Compose: https://docs.docker.com/compose/install/\"
    exit 1
fi

echo "✅ Docker gefunden"
echo ""

# Determine docker compose command
if docker compose version &> /dev/null; then
    DOCKER_COMPOSE="docker compose"
else
    DOCKER_COMPOSE="docker-compose"
fi

# Parse arguments
ACTION=${1:-up}

case $ACTION in
    up|start)
        echo "🚀 Starte ViperPay..."
        echo ""
        $DOCKER_COMPOSE up -d --build
        echo ""
        echo"✅ ViperPay wurde erfolgreich gestartet!\"
        echo"\"
        echo"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\"
        echo"\"
        echo"   🌐 App öffnen:     http://localhost\"
        echo"\"
        echo"   📧 Demo Account:   demo@viperpay.de\"
        echo"   🔑 Demo Passwort:  demo2024\"
        echo"\"
        echo"   📧 Admin Account:  admin@example.com\"
        echo"   🔑 Admin Passwort: admin123\"
        echo"\"
        echo"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\"
        echo"\"
        echo"   Befehle:\"
        echo"   ./start.sh stop     - Stoppen\"
        echo"   ./start.sh restart  - Neustarten\"
        echo"   ./start.sh logs     - Logs anzeigen\"
        echo"   ./start.sh clean    - Alles löschen\"
        echo""
        ;;
    down|stop)
        echo"🛑 Stoppe ViperPay...\"
        $DOCKER_COMPOSE down
        echo"✅ ViperPay wurde gestoppt.\"
        ;;
    restart)
        echo"🔄 Starte ViperPay neu...\"
        $DOCKER_COMPOSE down
        $DOCKER_COMPOSE up -d --build
        echo"✅ ViperPay wurde neu gestartet.\"
        ;;
    logs)
        echo"📋 Zeige Logs...\"
        $DOCKER_COMPOSE logs -f
        ;;
    clean)
        echo"🧹 Lösche alle Container und Daten...\"
        $DOCKER_COMPOSE down -v --rmi all
        echo"✅ Alles wurde gelöscht.\"
        ;;
    status)
        echo"📊 Status:\"
        $DOCKER_COMPOSE ps
        ;;
    *)
        echo"Verwendung: ./start.sh [up|stop|restart|logs|clean|status]\"
        echo""
        echo "  up/start  - Starte ViperPay (Standard)\"
        echo "  stop      - Stoppe ViperPay\"
        echo"  restart   - Starte ViperPay neu\"
        echo"  logs      - Zeige Live-Logs\"
        echo"  clean     - Lösche alle Container und Daten\"
        echo"  status    - Zeige Container-Status\"
        ;;
esac
