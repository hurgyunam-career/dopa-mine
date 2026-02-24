.PHONY: nav-check nav-hook-install

nav-check:
	dart run tools/check_navigation_routes_sync.dart

nav-hook-install:
ifeq ($(OS),Windows_NT)
	powershell -ExecutionPolicy Bypass -File tools/install_navigation_hook.ps1
else
	sh tools/install_navigation_hook.sh
endif
