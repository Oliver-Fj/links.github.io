        // Datos de ejemplo
        let linksData = [
            { week: 1, title: 'Enlace a GitHub 1', url: 'https://github.com/usuario/repo1', type: 'github' },
            { week: 1, title: 'PDF de la Semana 1', url: '/PDFs/Actividad01_AWM.pdf', type: 'pdf' },
            { week: 1, title: 'PDF de Infografia 1', url: '/PDFs/OliverFelixPerez.pdf', type: 'pdf' },
            { week: 2, title: 'Enlace a GitHub 3', url: 'https://github.com/usuario/repo3', type: 'github' },
            { week: 2, title: 'PDF de la semana 2', url: '/PDFs/Actividad02_AWM.pdf', type: 'pdf' },
            { week: 2, title: 'PDF de Infografia 2', url: '/PDFs/OliverFelixPerez.pdf', type: 'pdf' },
            { week: 3, title: 'Enlace a GitHub 5', url: 'https://github.com/Oliver-Fj/links.github.io/blob/main/semana3/hola-mundo.dart', type: 'github' },
            { week: 3, title: 'Enlace a GitHub 6', url: 'https://github.com/usuario/repo6', type: 'github' },
            { week: 3, title: 'PDF de la Semana 3', url: '/PDFs/Actividad03_AWM.pdf', type: 'pdf' },
        ];

        function renderLinks() {
            const weekContainer = document.getElementById('weekContainer');
            weekContainer.innerHTML = '';

            const weeks = [...new Set(linksData.map(link => link.week))];
            weeks.forEach(week => {
                const weekLinks = linksData.filter(link => link.week === week);
                const weekSection = document.createElement('div');
                weekSection.className = 'week-section';
                weekSection.innerHTML = `
                    <div class="week-header">
                        <span>Semana ${week}</span>
                        <span class="link-count">${weekLinks.length} enlaces</span>
                    </div>
                    <div class="week-content">
                        <div class="dropdown">
                            ${weekLinks.map(link => `
                                <a href="${link.url}" class="dropdown-item" data-type="${link.type}" target="_blank">${link.title}</a>
                            `).join('')}
                        </div>
                    </div>
                `;
                weekContainer.appendChild(weekSection);
            });

            // Reinicializar los event listeners
            initializeEventListeners();
            updateTotalLinkCount();
        }

        function initializeEventListeners() {
            document.querySelectorAll('.week-header').forEach(header => {
                header.addEventListener('click', () => {
                    header.nextElementSibling.classList.toggle('active');
                });
            });
        }

        function updateTotalLinkCount() {
            const totalCount = linksData.length;
            document.getElementById('totalLinkCount').textContent = `Total de enlaces: ${totalCount}`;
        }

        // Funcionalidad de búsqueda
        const searchBar = document.getElementById('searchBar');
        searchBar.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            document.querySelectorAll('.dropdown-item').forEach(item => {
                const text = item.textContent.toLowerCase();
                const weekSection = item.closest('.week-section');
                if (text.includes(searchTerm)) {
                    item.classList.remove('hidden');
                    weekSection.style.display = 'block';
                } else {
                    item.classList.add('hidden');
                }
            });

            document.querySelectorAll('.week-section').forEach(section => {
                const visibleItems = section.querySelectorAll('.dropdown-item:not(.hidden)');
                if (visibleItems.length === 0) {
                    section.style.display = 'none';
                } else {
                    section.style.display = 'block';
                }
                section.querySelector('.link-count').textContent = `${visibleItems.length} enlaces`;
            });
        });

        // Cambio de tema
        const themeToggle = document.getElementById('themeToggle');
        themeToggle.addEventListener('click', () => {
            document.body.classList.toggle('dark-theme');
            if (document.body.classList.contains('dark-theme')) {
                document.documentElement.style.setProperty('--bg-color', '#333');
                document.documentElement.style.setProperty('--text-color', '#f4f4f4');
                document.documentElement.style.setProperty('--dropdown-bg', '#444');
                document.documentElement.style.setProperty('--dropdown-hover', '#555');
                document.documentElement.style.setProperty('--border-color', '#666');
                themeToggle.textContent = '☀️';
            } else {
                document.documentElement.style.setProperty('--bg-color', '#f4f4f4');
                document.documentElement.style.setProperty('--text-color', '#333');
                document.documentElement.style.setProperty('--dropdown-bg', '#f9f9f9');
                document.documentElement.style.setProperty('--dropdown-hover', '#e9e9e9');
                document.documentElement.style.setProperty('--border-color', '#ddd');
                themeToggle.textContent = '🌓';
            }
        });

        // Filtrado por tipo
        document.querySelectorAll('.filter-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                const filter = this.getAttribute('data-filter');
                document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
                this.classList.add('active');

                document.querySelectorAll('.dropdown-item').forEach(item => {
                    if (filter === 'all' || item.getAttribute('data-type') === filter) {
                        item.style.display = 'block';
                    } else {
                        item.style.display = 'none';
                    }
                });

                document.querySelectorAll('.week-section').forEach(section => {
                    const visibleItems = section.querySelectorAll('.dropdown-item[style="display: block"]');
                    section.querySelector('.link-count').textContent = `${visibleItems.length} enlaces`;
                    section.style.display = visibleItems.length > 0 ? 'block' : 'none';
                });
            });
        });

        // Agregar nuevo enlace
        document.getElementById('addLinkForm').addEventListener('submit', function(e) {
            e.preventDefault();
            const newLink = {
                week: parseInt(document.getElementById('newLinkWeek').value),
                title: document.getElementById('newLinkTitle').value,
                url: document.getElementById('newLinkUrl').value,
                type: document.getElementById('newLinkType').value
            };
            linksData.push(newLink);
            renderLinks();
            this.reset();
        });

        // Inicializar la página
        renderLinks();